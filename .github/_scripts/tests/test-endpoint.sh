#!/bin/bash

set -euo pipefail

FILE="$1"

if grep -q '<!-- testable: false -->' "$FILE"; then
  echo "⏭️  Skipping $(basename "$FILE") (testable: false)"
  exit 0
fi

NAME="$(basename "$FILE" .md)"
GROUP="$(basename "$(dirname "$FILE")")"

echo " ▶️ Testing $GROUP/$NAME"

METHOD=$(grep -E '^(GET|POST|PUT|DELETE|PATCH) ' "$FILE" | cut -d' ' -f1 | head -n1)
ROUTE=$(grep -E '^(GET|POST|PUT|DELETE|PATCH) ' "$FILE" | cut -d' ' -f2 | head -n1)

if [[ -z "$METHOD" || -z "$ROUTE" ]]; then
  echo "❌ Could not find method or route in $FILE"
  exit 1
fi

EXPECTED_STATUS=$(grep -oE '<!-- expectedStatus: [0-9]+ -->' "$FILE" | grep -oE '[0-9]+' || echo "200")

ROUTE="${ROUTE/:websiteId/$TEST_WEBSITE_ID}"
ROUTE="${ROUTE/:sessionId/$TEST_SESSION_ID}"
ROUTE="${ROUTE/:userId/$TEST_USER_ID}"
ROUTE=$(echo "$ROUTE" | sed 's|^/api||')

[[ "${DEBUG:-}" == "true" ]] && echo "  🔧 Method: $METHOD"
[[ "${DEBUG:-}" == "true" ]] && echo "  🔧 Raw Route: $ROUTE"
[[ "${DEBUG:-}" == "true" ]] && echo "  🎯 Expected Status: $EXPECTED_STATUS"

MISMATCHES=()

check_types_recursive() {
  local expected="$1"
  local actual="$2"
  local path="${3:-root}"

  local expected_type actual_type
  expected_type=$(echo "$expected" | jq -r '
    if type == "string" then .
    elif type == "object" and has("type") and (keys_unsorted | length) == 1 then .type
    else type
    end'
  )
  actual_type=$(echo "$actual" | jq -r 'type')

  local allow_null="false"
  if [[ "$expected_type" == *"|null" ]]; then
    expected_type="${expected_type%%|null}"
    allow_null="true"
    if [[ "$actual_type" == "null" ]]; then return 0; fi
  fi

  if [[ "$expected_type" == "array" ]]; then
    if [[ "$actual_type" != "array" ]]; then
      MISMATCHES+=("Key '$path': Type mismatch – expected array but got $actual_type")
      return 1
    fi

    local expected_item
    expected_item=$(echo "$expected" | jq -c '
      if type == "object" and has("items") then .items
      elif type == "array" then .[0]
      else empty
      end'
    )

    if [[ -z "$expected_item" || "$expected_item" == "null" ]]; then
      MISMATCHES+=("Key '$path': Cannot determine expected item structure for array")
      return 1
    fi

    local has_errors=0
    local length
    length=$(echo "$actual" | jq 'length')

    for ((i=0; i<length; i++)); do
      local actual_item
      actual_item=$(echo "$actual" | jq -c ".[$i]")
      if ! check_types_recursive "$expected_item" "$actual_item" "$path[$i]"; then
        has_errors=1
      fi
    done

    return $has_errors
  fi

  if [[ "$expected_type" == "object" ]]; then
    if [[ "$actual_type" != "object" ]]; then
      MISMATCHES+=("Key '$path': Type mismatch – expected object but got $actual_type")
      return 1
    fi

    local keys has_errors=0
    keys=$(echo "$expected" | jq -r 'keys_unsorted[]')
    for key in $keys; do
      local expected_value actual_value has_key is_optional
      expected_value=$(echo "$expected" | jq -c --arg key "$key" '.[$key]')
      has_key=$(echo "$actual" | jq -e --arg key "$key" 'has($key)') || has_key="false"
      is_optional=$(echo "$expected_value" | jq -r '
        if type == "string" and test("\\|null$") then "true"
        elif type == "object" and .optional == true then "true"
        else "false" end'
      )
      if [[ "$has_key" != "true" ]]; then
        if [[ "$is_optional" == "true" ]]; then continue; fi
        MISMATCHES+=("Key '$path.$key': Missing required key")
        has_errors=1
        continue
      fi
      actual_value=$(echo "$actual" | jq -c --arg key "$key" '.[$key]')
      if ! check_types_recursive "$expected_value" "$actual_value" "$path.$key"; then
        has_errors=1
      fi
    done
    return $has_errors
  fi

  if [[ "$expected_type" == date* && "$actual_type" == "string" ]]; then
    local value
    value=$(echo "$actual" | jq -r .)
    if [[ "$expected_type" == "date" ]]; then
      if [[ ! "$value" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$ ]]; then
        MISMATCHES+=("Key '$path': Date format mismatch – expected ISO8601 (Z) but got \"$value\"")
        return 1
      fi
      return 0
    fi
    if [[ "$expected_type" == date:* ]]; then
      local format="${expected_type#date:}"
      local format_regex="$format"
      format_regex=$(echo "$format_regex" | sed -E \
        -e 's/yyyy/[0-9]{4}/g' \
        -e 's/mm/[0-9]{2}/g' \
        -e 's/dd/[0-9]{2}/g' \
        -e 's/Thh/\\T[0-9]{2}/g' \
        -e 's/hh/[0-9]{2}/g' \
        -e 's/ss/[0-9]{2}/g' \
        -e 's/Z$/Z/' )
      if [[ ! "$value" =~ ^$format_regex$ ]]; then
        MISMATCHES+=("Key '$path': Date format mismatch – expected format $format but got \"$value\"")
        return 1
      fi
      return 0
    fi
  fi

  if [[ "$expected_type" != "$actual_type" ]]; then
    local actual_str
    actual_str=$(echo "$actual" | jq -c . 2>/dev/null || echo "<unreadable>")
    MISMATCHES+=("Key '$path': Type mismatch – expected $expected_type but got $actual_type (value: $actual_str)")
    return 1
  fi

  return 0
}

CURL_ARGS=(-s -w "%{http_code}" -o tmp_response.json -X "$METHOD" \
  -H "x-umami-api-key: $API_KEY" \
  -H "Content-Type: application/json" \
  -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 14_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15")

RAW_BODY="{}"

make_json_safe() {
  local value="$1"
  local type="${2:-string}"

  if [[ "$type" == "array" && ( -z "$value" || "$value" == "-" ) ]]; then
    echo "[]"
    return 0
  fi

  if [[ -z "$value" || "$value" == "-" ]]; then
    return 1
  fi

  fix_json_syntax() {
    echo "$1" |
      sed -E 's/([{,])\s*([a-zA-Z0-9_]+)\s*:/\1"\2":/g' |
      sed -E 's/:\s*([^"{[][^\s,}]*)/\: "\1"/g' |
      sed -E 's/:\s*"\s*([^"]*?)\s*"/: "\1"/g'
  }

  if [[ "$type" == "array" ]]; then
    local parts=()

    if [[ "$value" =~ ^\{.*\},[[:space:]]*\{.*\}$ ]]; then
      IFS=$'\n' read -rd '' -a parts < <(
        echo "$value" | sed 's/},[[:space:]]*{/\}|SPLIT|\{/g' | tr '|SPLIT|' '\n'
      )
    else
      parts=("$value")
    fi

    local fixed_array=()
    for part in "${parts[@]}"; do
      fixed=$(fix_json_syntax "$part")
      if echo "$fixed" | jq empty >/dev/null 2>&1; then
        fixed_array+=("$fixed")
      else
        echo "  ⚠️  Skipping invalid array item: $fixed" >&2
      fi
    done

    local joined
    joined=$(IFS=,; echo "[${fixed_array[*]}]")
    echo "$joined"
    return 0
  fi

  if [[ "$value" =~ ^\{.*\}$ ]]; then
    local fixed
    fixed=$(fix_json_syntax "$value")
    if echo "$fixed" | jq empty >/dev/null 2>&1; then
      echo "$fixed"
      return 0
    else
      echo "  ⚠️  Invalid object value after fix: $fixed" >&2
      return 1
    fi
  fi

  if echo "$value" | jq empty >/dev/null 2>&1; then
    echo "$value"
    return 0
  fi

  if [[ "$type" == "number" && "$value" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "$value"
    return 0
  fi

  if [[ "$type" == "boolean" && "$value" =~ ^(true|false)$ ]]; then
    echo "$value"
    return 0
  fi

  printf '"%s"' "$value"
  return 0
}

add_to_json() {
  local path="$1"
  local value="$2"
  local type="$3"

  value="${value/:websiteId/$TEST_WEBSITE_ID}"
  value="${value/:sessionId/$TEST_SESSION_ID}"
  value="${value/:userId/$TEST_USER_ID}"

  if [[ "$value" == "-" ]]; then return; fi

  safe_value=$(make_json_safe "$value" "$type") || {
    echo "  ⚠️  Skipping invalid JSON value for '$path'"
    return
  }

  [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding body param '$path' = '$value' (type: $type)"

  IFS='.' read -ra keys <<< "$path"
  local json="$safe_value"
  for (( idx=${#keys[@]}-1 ; idx>=0 ; idx-- )); do
    json="{\"${keys[$idx]}\":$json}"
  done

  RAW_BODY=$(jq -c --argjson new "$json" '. * $new' <<< "$RAW_BODY") || {
    echo "  ⚠️  Failed to inject JSON for '$path'"
  }
}

if [[ "$METHOD" =~ ^(POST|PUT|PATCH)$ ]]; then
  if grep -q "### 📩 Request Body Parameters" "$FILE"; then
    [[ "${DEBUG:-}" == "true" ]] && echo "  📦 Building request body from 📩 table"
    mapfile -t body_lines < <(
      awk '/### 📩 Request Body Parameters/{flag=1; next} /^### /{flag=0} flag' "$FILE" |
      awk 'NR>2 && $0 ~ /\|/'
    )
    for line in "${body_lines[@]}"; do
      IFS='|' read -r _ name type _ example required _ <<< "$line"
      name=$(echo "$name" | xargs)
      type=$(echo "$type" | xargs | tr '[:upper:]' '[:lower:]')
      example=$(echo "$example" | xargs)
      required=$(echo "$required" | xargs | tr '[:upper:]' '[:lower:]')

      [[ "$name" =~ ^(:?-+|name)$ ]] && continue

      if [[ -z "$example" && "$required" == "no" ]]; then continue; fi

      [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding body param '$name' = '$example' (type: $type)"
      add_to_json "$name" "$example" "$type"
    done
  fi
  [[ "${DEBUG:-}" == "true" ]] && echo "  📦 Final JSON Body:" && echo "$RAW_BODY" | jq .
  [[ -n "$RAW_BODY" ]] && CURL_ARGS+=(-d "$RAW_BODY")
fi

QUERY_PARAMS=()
if grep -q "### 🔍 Query Parameters" "$FILE"; then
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔍 Reading query parameters from $FILE"
  mapfile -t query_lines < <(
    awk '/### 🔍 Query Parameters/{flag=1; next} /^### /{flag=0} flag' "$FILE" |
    awk 'NR>2 && $0 ~ /\|/'
  )
  for line in "${query_lines[@]}"; do
    IFS='|' read -r _ name type _ example required _ <<< "$line"
    name=$(echo "$name" | xargs)
    type=$(echo "$type" | xargs | tr '[:upper:]' '[:lower:]')
    example=$(echo "$example" | xargs)
    required=$(echo "$required" | xargs | tr '[:upper:]' '[:lower:]')

    [[ "$name" =~ ^(:?-+|name)$ ]] && continue
    [[ -z "$example" || "$required" == "no" ]] && continue

    example="${example/:websiteId/$TEST_WEBSITE_ID}"
    example="${example/:sessionId/$TEST_SESSION_ID}"
    example="${example/:userId/$TEST_USER_ID}"
    [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding required query param '$name' = '$example'"
    QUERY_PARAMS+=("${name}=${example}")
  done
fi

if [[ "${DEBUG:-}" == "true" && ${#QUERY_PARAMS[@]} -gt 0 ]]; then
  echo "  🧪 Query Parameters:"
  for param in "${QUERY_PARAMS[@]}"; do
    echo "    - $param"
  done
fi




if [[ "$ROUTE" =~ ^https?:// ]]; then
  BASE="$ROUTE"
else
  BASE="$BASE_URL$ROUTE"
fi

if [[ ${#QUERY_PARAMS[@]} -gt 0 ]]; then
  QUERY_STRING=$(IFS='&'; echo "${QUERY_PARAMS[*]}")
  FINAL_URL="${BASE}?${QUERY_STRING}"
else
  FINAL_URL="$BASE"
fi



[[ "${DEBUG:-}" == "true" ]] && echo "  🌐 Final Request URL: $FINAL_URL"
CURL_ARGS+=("$FINAL_URL")
[[ "${DEBUG:-}" == "true" ]] && printf "  📥 Running curl:" && for arg in "${CURL_ARGS[@]}"; do printf " %q" "$arg"; done && echo

CODE=$(curl "${CURL_ARGS[@]}")
BODY_TEXT=$(cat tmp_response.json)

if [[ "$CODE" == "$EXPECTED_STATUS" ]]; then
  echo "  ✅ Status code check succeeded ($CODE)"
else
  echo "  ❌ Status code check failed – expected $EXPECTED_STATUS but got $CODE"
fi



EXPECTED_BODY=""
if grep -q "### 📘 Response Structure" "$FILE"; then
  if [[ "${DEBUG:-}" == "true" ]]; then echo "  📘 Parsing response structure block..."; fi

  RAW_STRUCTURE=$(awk '
    /### 📘 Response Structure/ { found=1; next }
    found && /^```/ { in_block = !in_block; next }
    found && in_block { print }
  ' "$FILE")

  # EXPECTED_BODY=$(jq -c . <<< "$RAW_STRUCTURE" 2>/dev/null || echo "")
  RAW_JSON=$(jq -c . <<< "$RAW_STRUCTURE" 2>/dev/null || echo "")
  EXPECTED_BODY=""
  if [[ -n "$RAW_JSON" ]]; then
    # Prüfen, ob Struktur so aussieht wie: [["number"]] o. Ä.
    IS_TYPED_ARRAY=$(echo "$RAW_JSON" | jq -e '
      type == "array" and
      length > 0 and
      .[0] | type == "array" and
      .[0][0] | type == "string" and
      (.[0][0] | test("^(string|number|boolean|object|array|null)$"))
    ' 2>/dev/null && echo "true" || echo "false")

    if [[ "$IS_TYPED_ARRAY" == "true" ]]; then
      FIRST_TYPE=$(echo "$RAW_JSON" | jq -r '.[0][0]')
      EXPECTED_BODY=$(jq -n --arg t "$FIRST_TYPE" '{
        type: "array",
        items: {
          type: "array",
          items: { type: $t }
        }
      }')
      [[ "${DEBUG:-}" == "true" ]] && echo "  🧠 Interpreted [[\"$FIRST_TYPE\"]] as nested array type"
    else
      EXPECTED_BODY="$RAW_JSON"
    fi

    if [[ -n "$EXPECTED_BODY" ]]; then
      [[ "${DEBUG:-}" == "true" ]] && echo "  📘 Loaded expected body structure:"
      [[ "${DEBUG:-}" == "true" ]] && echo "$EXPECTED_BODY" | jq .
    else
      [[ "${DEBUG:-}" == "true" ]] && echo "  ⚠️ Invalid or empty JSON in 📘 Response Structure"
    fi
  fi






  if [[ -n "$EXPECTED_BODY" ]]; then
    [[ "${DEBUG:-}" == "true" ]] && echo "  📘 Loaded expected body structure:"
    [[ "${DEBUG:-}" == "true" ]] && echo "$EXPECTED_BODY" | jq .
  else
    [[ "${DEBUG:-}" == "true" ]] && echo "  ⚠️ Invalid or empty JSON in 📘 Response Structure"
  fi
fi

if [[ "${DEBUG:-}" == "true" ]]; then
  echo "  📨 Raw Response Body:"
  if jq -e . tmp_response.json >/dev/null 2>&1; then
    jq . tmp_response.json
  else
    cat tmp_response.json
  fi
fi


IS_VALID_JSON=false
ACTUAL_BODY=""
if jq -e . tmp_response.json >/dev/null 2>&1; then
  ACTUAL_BODY=$(jq -c . tmp_response.json)
  IS_VALID_JSON=true
fi

if [[ -n "$EXPECTED_BODY" && "$IS_VALID_JSON" == true ]]; then
  [[ "${DEBUG:-}" == "true" ]] && echo "🧪 Starting body type check..."
  EXPECTED_BODY_TYPE=$(echo "$EXPECTED_BODY" | jq -r 'type')
  ACTUAL_BODY_TYPE=$(echo "$ACTUAL_BODY" | jq -r 'type')

  [[ "${DEBUG:-}" == "true" ]] && echo "  📦 Expected body type: $EXPECTED_BODY_TYPE"
  [[ "${DEBUG:-}" == "true" ]] && echo "  📬 Actual body type:   $ACTUAL_BODY_TYPE"

  if [[ "$EXPECTED_BODY_TYPE" == "$ACTUAL_BODY_TYPE" ]]; then
    check_types_recursive "$EXPECTED_BODY" "$ACTUAL_BODY" "root"
  else
    #MISMATCHES+=("Root: Type mismatch – expected $EXPECTED_BODY_TYPE but got $ACTUAL_BODY_TYPE")
    MISMATCHES+=("Key 'root': Type mismatch – expected $EXPECTED_BODY_TYPE but got $ACTUAL_BODY_TYPE")
  fi

  if [[ ${#MISMATCHES[@]} -gt 0 ]]; then
    echo "  ❌ Body does not match expected structure"
    echo "  ⚠️  Type mismatches:"
    for m in "${MISMATCHES[@]}"; do
      echo "    - $m"
    done
  else
    echo "  ✅ Body matches expected structure"
  fi
elif [[ -n "$EXPECTED_BODY" && "$IS_VALID_JSON" == false ]]; then
  echo "  ❌ Response is not valid JSON – cannot perform type check"
fi


SECRETS_TO_MASK=("$TEST_WEBSITE_ID" "$TEST_SESSION_ID" "$TEST_USER_ID" "$API_KEY")
redact_secrets() {
  local content="$1"
  for secret in "${SECRETS_TO_MASK[@]}"; do
    content=$(echo "$content" | sed "s|$secret|xxxxx|g")
  done
  echo "$content"
}
anonymize_response_values() {
  jq '
    def mask_string:
      if type == "string" then
        "*" * length
      else
        .
      end;

    def mask_value:
      if type == "string" then mask_string
      elif type == "number" then 0
      elif type == "boolean" then false
      elif type == "array" then map(mask_value)
      elif type == "object" then with_entries(.value |= mask_value)
      else .
      end;

    mask_value
  ' <<< "$1" 2>/dev/null |
  sed -E 's/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/*****-****-****-****-************/g'
}
pretty_json() {
  local input="$1"

  if echo "$input" | jq empty >/dev/null 2>&1; then
    echo "$input" | jq .
    return
  fi

  if [[ "$input" =~ ^\".*\"$ ]]; then
    echo "$input" | jq -r .
    return
  fi

  echo "$input"
}

if [[ "${DEBUG:-}" == "true" ]]; then
  echo "  DEBUG: Status=$CODE, expected=$EXPECTED_STATUS"
  echo "  DEBUG: MISMATCH count = ${#MISMATCHES[@]}"
fi 







if [[ "$CODE" != "$EXPECTED_STATUS" || ${#MISMATCHES[@]} -gt 0 ]]; then
  if [[ "${DEBUG:-}" == "true" ]]; then
    echo "  DEBUG inline block: Status=$CODE, expected=$EXPECTED_STATUS"
    echo "  DEBUG inline block: MISMATCH count = ${#MISMATCHES[@]}"
  fi 

  if [[ ${#MISMATCHES[@]} -eq 0 ]]; then
    MISMATCHES_JOINED="(none)"
  else
    MISMATCHES_JOINED=""
    for m in "${MISMATCHES[@]}"; do
      echo "  DEBUG raw mismatch: [$m]"
      sanitized="$(redact_secrets "$m")"
      echo "  DEBUG sanitized: [$sanitized]"
      MISMATCHES_JOINED+="$sanitized"$'\n'
    done
  fi
  echo "  DEBUG inline block: $MISMATCHES_JOINED"



  mkdir -p failures
  FILENAME="failures/${GROUP}__${NAME}.txt"

  {
    echo "Group: $GROUP"
    echo "Name: $NAME"
    echo "Method: $METHOD"
    echo "Route: $(redact_secrets "$ROUTE")"
    echo "URL: $(redact_secrets "$FINAL_URL")"
    echo "Expected Status: $EXPECTED_STATUS"
    echo "Actual Status: $CODE"
    echo
    echo "Request Body:"
    pretty_json "$(anonymize_response_values "$(redact_secrets "$RAW_BODY")")"
    echo
    echo "Response Body:"
    pretty_json "$(anonymize_response_values "$(redact_secrets "$BODY_TEXT")")"
    echo
    echo "Expected Body (types):"
    pretty_json "$(redact_secrets "$EXPECTED_BODY")"
    echo
    echo "Type mismatches:"
    echo $MISMATCHES_JOINED
  } > "$FILENAME"

  if [[ -n "${GITHUB_STEP_SUMMARY:-}" ]]; then
    {
      echo "**❌ $GROUP / $NAME**"
      echo "- **Method**: \`$METHOD\`"
      echo "- **Route**: \`$(redact_secrets "$ROUTE")\`"
      echo "- **Expected**: \`$EXPECTED_STATUS\`, got \`$CODE\`"
      echo ""

      echo "<details><summary>Request Body</summary>"
      echo
      echo '```json'
      pretty_json "$(anonymize_response_values "$(redact_secrets "$RAW_BODY")")"
      echo '```'
      echo "</details>"
      echo ""

      echo "<details><summary>Response Body</summary>"
      echo
      echo '```json'
      pretty_json "$(anonymize_response_values "$(redact_secrets "$BODY_TEXT")")"
      echo '```'
      echo "</details>"
      echo ""

      echo "<details><summary>Expected Body (types)</summary>"
      echo
      echo '```json'
      pretty_json "$(redact_secrets "$EXPECTED_BODY")"
      echo '```'
      echo "</details>"
      echo ""

      echo "**Type mismatches:**"
      echo '```'
      echo $MISMATCHES_JOINED
      echo '```'
      echo "---"
      echo ""
    } >> "$GITHUB_STEP_SUMMARY"
  fi
fi