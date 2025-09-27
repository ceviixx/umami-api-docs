#!/bin/bash

set -euo pipefail

# URL encoding function for query parameters
url_encode() {
  local string="$1"
  # Use printf to handle special characters properly
  printf '%s' "$string" | while IFS= read -r -n1 char; do
    case "$char" in
      [a-zA-Z0-9.~_-]) printf '%s' "$char" ;;
      *) printf '%%%02X' "'$char" ;;
    esac
  done
}

# Enhanced test-endpoint.sh with CRUD orchestration support
# This script maintains all existing functionality while adding ID management

FILE="$1"

# Check if endpoint is marked as removed (highest priority)
if grep -q '<!-- removed: true -->' "$FILE" || grep -q '<!-- removed -->' "$FILE"; then
  echo "🛑 Skipping $(basename "$FILE") (marked as removed)"
  exit 0
fi

# Check if endpoint is marked as not testable
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

# Enhanced ID replacement - use orchestrator state if available (CRUD context only)
replace_route_ids() {
  local route="$1"
  local original_route="$route"
  
  # Use orchestrator state ONLY in CRUD context (when CRUD_GROUP is set)
  if [[ -n "${CRUD_STATE_FILE:-}" && -f "${CRUD_STATE_FILE:-}" && -n "${CRUD_GROUP:-}" ]]; then
    # Get IDs from state file
    team_id=$(jq -r '.teams // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    user_id=$(jq -r '.users // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    website_id=$(jq -r '.websites // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    report_id=$(jq -r '.reports // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    session_id=$(jq -r '.sessions // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    
    # Debug: Show state file contents (to stderr)
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔍 [CRUD] State File IDs: teams=$team_id, users=$user_id, websites=$website_id, reports=$report_id, sessions=$session_id" >&2
    
    # Replace with actual IDs if available
    if [[ -n "$team_id" && "$route" == *":teamId"* ]]; then
      route="${route/:teamId/$team_id}"
      [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [CRUD] Replaced :teamId with $team_id" >&2
    fi
    if [[ -n "$user_id" && "$route" == *":userId"* ]]; then
      route="${route/:userId/$user_id}"
      [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [CRUD] Replaced :userId with $user_id" >&2
    fi
    if [[ -n "$website_id" && "$route" == *":websiteId"* ]]; then
      route="${route/:websiteId/$website_id}"
      [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [CRUD] Replaced :websiteId with $website_id" >&2
    fi
    if [[ -n "$report_id" && "$route" == *":reportId"* ]]; then
      route="${route/:reportId/$report_id}"
      [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [CRUD] Replaced :reportId with $report_id" >&2
    fi
    if [[ -n "$session_id" && "$route" == *":sessionId"* ]]; then
      route="${route/:sessionId/$session_id}"
      [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [CRUD] Replaced :sessionId with $session_id" >&2
    fi
  elif [[ -n "${CRUD_STATE_FILE:-}" && -f "${CRUD_STATE_FILE:-}" ]]; then
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 [STANDALONE] Skipping state file - using static IDs for individual test" >&2
  fi
  
  # Fallback to environment variables if not already replaced by state
  if [[ "$route" == *":websiteId"* ]]; then
    route="${route/:websiteId/${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [FALLBACK] Replaced :websiteId with static env var ${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" >&2
  fi
  if [[ "$route" == *":sessionId"* ]]; then
    route="${route/:sessionId/${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [FALLBACK] Replaced :sessionId with static env var ${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" >&2
  fi
  if [[ "$route" == *":userId"* ]]; then
    route="${route/:userId/${TEST_USER_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [FALLBACK] Replaced :userId with static env var ${TEST_USER_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" >&2
  fi
  
  # Debug: Show route transformation (to stderr)
  [[ "${DEBUG:-}" == "true" && "$original_route" != "$route" ]] && echo "  🛣️  Route: $original_route → $route" >&2
  
  echo "$route"
}

ROUTE=$(replace_route_ids "$ROUTE")
ROUTE=$(echo "$ROUTE" | sed 's|^/api||')

[[ "${DEBUG:-}" == "true" ]] && echo "  🔧 Method: $METHOD"
[[ "${DEBUG:-}" == "true" ]] && echo "  🔧 Raw Route: $ROUTE"
[[ "${DEBUG:-}" == "true" ]] && echo "  🎯 Expected Status: $EXPECTED_STATUS"

MISMATCHES=()

# Disable exit-on-error early to prevent premature script termination
# This ensures failure handling code can be reached even when commands fail
set +e

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

    # If expected array is empty [], skip validation (accept any array content)
    if [[ -z "$expected_item" || "$expected_item" == "null" ]]; then
      return 0  # Empty array expectation - accept any actual array content
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
      if [[ ! "$value" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]{3})?Z$ ]]; then
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
  -H "x-umami-api-key: ${API_KEY:-your-api-key}" \
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
      sed -E 's/:\s*([^"{[][^\s,}]*)/: "\1"/g' |
      sed -E 's/:\s*"\s*([^"]*)\s*"/: "\1"/g'
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
  local original_value="$value"

  # Check if current CRUD group has use_static_website_id flag
  local use_static_website_id=false
  if [[ -n "${CRUD_GROUP:-}" && -f ".github/_scripts/test-orchestrated-api/crud-mapping.json" ]]; then
    use_static_website_id=$(jq -r --arg group "${CRUD_GROUP}" '.crud_groups[$group].use_static_website_id // false' ".github/_scripts/test-orchestrated-api/crud-mapping.json" 2>/dev/null || echo "false")
  fi

  # Special handling for websiteId parameter based on configuration
  if [[ "$path" == "websiteId" && "$use_static_website_id" == "true" ]]; then
    value="${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}"
    [[ "${DEBUG:-}" == "true" ]] && echo "  🏷️  [CONFIG] Using static TEST_WEBSITE_ID for ${CRUD_GROUP} group (use_static_website_id=true)"
  # Enhanced ID replacement for request body (CRUD context only)
  elif [[ -n "${CRUD_STATE_FILE:-}" && -f "${CRUD_STATE_FILE:-}" && -n "${CRUD_GROUP:-}" ]]; then
    team_id=$(jq -r '.teams // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    user_id=$(jq -r '.users // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    website_id=$(jq -r '.websites // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    report_id=$(jq -r '.reports // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    session_id=$(jq -r '.sessions // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
    
    [[ -n "$team_id" ]] && value="${value/:teamId/$team_id}"
    [[ -n "$user_id" ]] && value="${value/:userId/$user_id}"
    [[ -n "$website_id" ]] && value="${value/:websiteId/$website_id}"
    [[ -n "$report_id" ]] && value="${value/:reportId/$report_id}"
    [[ -n "$session_id" ]] && value="${value/:sessionId/$session_id}"
  fi

  # Fallback to environment variables ONLY if not already replaced
  [[ "$value" == *":websiteId"* ]] && value="${value/:websiteId/${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
  [[ "$value" == *":sessionId"* ]] && value="${value/:sessionId/${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
  [[ "$value" == *":userId"* ]] && value="${value/:userId/${TEST_USER_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
  
  # Handle static UUID examples for specific parameter paths
  if [[ "$value" == "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" ]]; then
    case "$path" in
      "websiteId"|"payload.website") value="${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
      "sessionId"|"visitId"|"payload.session") value="${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
      "userId"|"payload.user") value="${TEST_USER_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
      "teamId") value="${TEST_TEAM_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
      "reportId") value="${TEST_REPORT_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
    esac
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [UUID] Replaced static UUID for '$path' with $value"
  fi

  if [[ "$value" == "-" ]]; then return; fi

  safe_value=$(make_json_safe "$value" "$type") || {
    echo "  ⚠️  Skipping invalid JSON value for '$path'"
    return
  }

  [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding body param '$path' = '$value' (original: '$original_value', type: $type)"
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 Current RAW_BODY before addition: $RAW_BODY"

  IFS='.' read -ra keys <<< "$path"
  local json="$safe_value"
  for (( idx=${#keys[@]}-1 ; idx>=0 ; idx-- )); do
    json="{\"${keys[$idx]}\":$json}"
  done

  [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 New JSON to merge: $json"

  RAW_BODY=$(jq -c --argjson new "$json" '. * $new' <<< "$RAW_BODY") || {
    echo "  ⚠️  Failed to inject JSON for '$path'"
  }

  [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 RAW_BODY after addition: $RAW_BODY"
}

if [[ "$METHOD" =~ ^(POST|PUT|PATCH)$ ]]; then
  if grep -q "### 📩 Request Body Parameters" "$FILE"; then
    [[ "${DEBUG:-}" == "true" ]] && echo "  📦 Building request body from 📩 table"
    body_lines=()
    while IFS= read -r line; do
      body_lines+=("$line")
    done < <(
      awk '/### 📩 Request Body Parameters/{flag=1; next} /^### /{flag=0} flag' "$FILE" |
      awk 'NR>2 && $0 ~ /\|/'
    )
    
    [[ "${DEBUG:-}" == "true" ]] && echo "  🔍 Found ${#body_lines[@]} body parameter lines:"
    for line in "${body_lines[@]}"; do
      [[ "${DEBUG:-}" == "true" ]] && echo "    Line: $line"
      IFS='|' read -r _ name type _ example required _ <<< "$line"
      name=$(echo "$name" | xargs)
      type=$(echo "$type" | xargs | tr '[:upper:]' '[:lower:]')
      example=$(echo "$example" | xargs)
      required=$(echo "$required" | xargs | tr '[:upper:]' '[:lower:]')

      [[ "${DEBUG:-}" == "true" ]] && echo "    Parsed: name='$name', type='$type', example='$example', required='$required'"

      # Skip table header and separator lines, but NOT actual parameter named "name"
      [[ "$name" =~ ^(:?-+|Name)$ ]] && continue

      # Skip optional parameters (required = no), but handle arrays specially
      if [[ "$required" == "no" ]]; then 
        [[ "${DEBUG:-}" == "true" ]] && echo "    Skipping: not required (required='$required')"
        continue 
      fi
      
      # Handle required parameters without examples
      if [[ -z "$example" ]]; then
        if [[ "$type" == "array" ]]; then
          # For required arrays without example, use empty value (make_json_safe will create [])
          [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding required array '$name' = '[]' (no example provided)"
          add_to_json "$name" "" "$type"
        else
          # For other types, skip if no example provided
          [[ "${DEBUG:-}" == "true" ]] && echo "    Skipping: no example provided for non-array type '$type'"
          continue
        fi
      else
        # Parameter has example, add it normally
        [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding body param '$name' = '$example' (type: $type)"
        add_to_json "$name" "$example" "$type"
      fi
    done
  fi
  [[ "${DEBUG:-}" == "true" ]] && echo "  📦 Final JSON Body:" && echo "$RAW_BODY" | jq .
  [[ -n "$RAW_BODY" ]] && CURL_ARGS+=(-d "$RAW_BODY")
fi

QUERY_PARAMS=()
if grep -q "### 🔍 Query Parameters" "$FILE"; then
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔍 Reading query parameters from $FILE"
  query_lines=()
  while IFS= read -r line; do
    query_lines+=("$line")
  done < <(
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

    # Enhanced ID replacement for query parameters (CRUD context only)
    if [[ -n "${CRUD_STATE_FILE:-}" && -f "${CRUD_STATE_FILE:-}" && -n "${CRUD_GROUP:-}" ]]; then
      team_id=$(jq -r '.teams // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
      user_id=$(jq -r '.users // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
      website_id=$(jq -r '.websites // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
      report_id=$(jq -r '.reports // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
      session_id=$(jq -r '.sessions // empty' "$CRUD_STATE_FILE" 2>/dev/null || echo "")
      
      [[ -n "$team_id" ]] && example="${example/:teamId/$team_id}"
      [[ -n "$user_id" ]] && example="${example/:userId/$user_id}"
      [[ -n "$website_id" ]] && example="${example/:websiteId/$website_id}"
      [[ -n "$report_id" ]] && example="${example/:reportId/$report_id}"
      [[ -n "$session_id" ]] && example="${example/:sessionId/$session_id}"
    fi

    # Fallback to environment variables ONLY if not already replaced
    [[ "$example" == *":websiteId"* ]] && example="${example/:websiteId/${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
    [[ "$example" == *":sessionId"* ]] && example="${example/:sessionId/${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
    [[ "$example" == *":userId"* ]] && example="${example/:userId/${TEST_USER_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}}"
    
    # Handle static UUID examples for specific query parameter names
    if [[ "$example" == "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" ]]; then
      case "$name" in
        "websiteId"|"website") example="${TEST_WEBSITE_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
        "sessionId"|"visitId"|"session") example="${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
        "userId"|"user") example="${TEST_USER_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
        "teamId"|"team") example="${TEST_TEAM_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
        "reportId"|"report") example="${TEST_REPORT_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}" ;;
      esac
      [[ "${DEBUG:-}" == "true" ]] && echo "  🔄 [UUID] Replaced static UUID for query param '$name' with $example"
    fi
    [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ Adding required query param '$name' = '$example'"
    
    # URL encode the parameter value to handle spaces and special characters
    encoded_value=$(url_encode "$example")
    QUERY_PARAMS+=("${name}=${encoded_value}")
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
  BASE="${BASE_URL:-https://api.umami.is/v1}$ROUTE"
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

# Execute curl in safe context to prevent script abort on malformed URLs
set +e  # Temporarily disable exit-on-error
CODE=$(curl "${CURL_ARGS[@]}" 2>/dev/null)
CURL_EXIT_CODE=$?
set -e  # Re-enable exit-on-error

# Handle curl execution failure
if [[ $CURL_EXIT_CODE -ne 0 ]]; then
  echo "  ❌ Curl command failed with exit code $CURL_EXIT_CODE (likely malformed URL)"
  CODE="000"  # Set a recognizable error code
  echo "curl_error" > tmp_response.json
fi

BODY_TEXT=$(cat tmp_response.json 2>/dev/null || echo "no_response")

# Trim whitespace from CODE and EXPECTED_STATUS
CODE=$(echo "$CODE" | tr -d ' \t\n\r')
EXPECTED_STATUS=$(echo "$EXPECTED_STATUS" | tr -d ' \t\n\r')

if [[ "${DEBUG:-}" == "true" ]]; then
  echo "  🔍 DEBUG: Raw CODE='$CODE' (length: ${#CODE})"
  echo "  🔍 DEBUG: Raw EXPECTED_STATUS='$EXPECTED_STATUS' (length: ${#EXPECTED_STATUS})"
  echo "  🔍 DEBUG: CODE hex: $(echo -n "$CODE" | xxd -p)"
  echo "  🔍 DEBUG: EXPECTED_STATUS hex: $(echo -n "$EXPECTED_STATUS" | xxd -p)"
fi

if [[ "$CODE" == "$EXPECTED_STATUS" ]]; then
  echo "  ✅ Status code check succeeded ($CODE)"
else
  echo "  ❌ Status code check failed – expected $EXPECTED_STATUS but got $CODE"
fi

# Show trace execution flow only in DEBUG mode
[[ "${DEBUG:-}" == "true" ]] && echo "  🔍 TRACE: After status check, about to continue with body parsing..."
[[ "${DEBUG:-}" == "true" ]] && echo "  🔍 TRACE: Current CODE='$CODE', EXPECTED='$EXPECTED_STATUS'"

# CRITICAL: Disable exit-on-error BEFORE body parsing - check_types_recursive can return 1
set +e

EXPECTED_BODY=""
if grep -q "### 📘 Response Structure" "$FILE"; then
  if [[ "${DEBUG:-}" == "true" ]]; then echo "  📘 Parsing response structure block..."; fi

  RAW_STRUCTURE=$(awk '
    /### 📘 Response Structure/ { found=1; next }
    found && /^```/ { in_block = !in_block; next }
    found && in_block { print }
  ' "$FILE")

  RAW_JSON=$(jq -c . <<< "$RAW_STRUCTURE" 2>/dev/null || echo "")
  EXPECTED_BODY=""
  if [[ -n "$RAW_JSON" ]]; then
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

SECRETS_TO_MASK=("${API_KEY:-your-api-key}")

# Debug-aware secret redaction - only mask sensitive secrets, not debugging IDs
redact_secrets() {
  local content="$1"
  local mask_website_ids="${2:-true}"  # Allow override for debugging
  
  # Always mask API key
  for secret in "${SECRETS_TO_MASK[@]}"; do
    content=$(echo "$content" | sed "s|$secret|***|g")
  done
  
  # Always mask UUIDs in URLs and routes to the consistent pattern
  content=$(echo "$content" | sed -E 's/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/********-****-****-************/g')
  
  # In DEBUG mode, keep Website IDs visible for debugging CRUD workflows  
  # Note: Static test IDs are already masked by UUID pattern above
  if [[ "${DEBUG:-}" != "true" && "$mask_website_ids" == "true" ]]; then
    # Only mask static env var IDs that aren't UUIDs
    [[ -n "${TEST_WEBSITE_ID:-}" ]] && content=$(echo "$content" | sed "s|${TEST_WEBSITE_ID}|***|g")
    [[ -n "${TEST_SESSION_ID:-}" ]] && content=$(echo "$content" | sed "s|${TEST_SESSION_ID}|***|g") 
    [[ -n "${TEST_USER_ID:-}" ]] && content=$(echo "$content" | sed "s|${TEST_USER_ID}|***|g")
  fi
  
  echo "$content"
}

anonymize_response_values() {
  local input="$1"
  
  # Check if the response contains an error - if so, don't mask error details
  if echo "$input" | jq -e 'has("error")' >/dev/null 2>&1; then
    # Response has error - only mask UUIDs but preserve error details
    echo "$input" | jq '
      def mask_uuid_only:
        if type == "string" then
          if test("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$") then
            "********-****-****-************"
          else
            .  # Preserve the original string (especially error messages)
          end
        else
          .
        end;

      def preserve_error_but_mask_uuids:
        if type == "string" then mask_uuid_only
        elif type == "array" then map(preserve_error_but_mask_uuids)
        elif type == "object" then with_entries(.value |= preserve_error_but_mask_uuids)
        else .
        end;

      preserve_error_but_mask_uuids
    ' 2>/dev/null
    return
  fi
  
  # Always mask UUIDs to the pattern ********-****-****-************
  # In DEBUG mode, preserve other debugging info but still mask UUIDs
  if [[ "${DEBUG:-}" == "true" ]]; then
    echo "$input" | jq '
      def mask_string:
        if type == "string" then
          if test("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$") then
            "********-****-****-************"  # Always mask UUIDs
          else
            "*" * length
          end
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
    ' 2>/dev/null
  else
    # Production mode: mask everything including UUIDs
    echo "$input" | jq '
      def mask_string:
        if type == "string" then
          if test("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$") then
            "********-****-****-************"  # Always mask UUIDs
          else
            "*" * length
          end
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
    ' 2>/dev/null
  fi
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
  echo "  DEBUG: Status check: '$CODE' != '$EXPECTED_STATUS' = $([[ "$CODE" != "$EXPECTED_STATUS" ]] && echo 'true' || echo 'false')"
  echo "  DEBUG: Mismatch check: ${#MISMATCHES[@]} -gt 0 = $([[ ${#MISMATCHES[@]} -gt 0 ]] && echo 'true' || echo 'false')"
fi 

# Always show this debug info to see if this section is reached
echo "  🔎 About to check failure condition: CODE='$CODE' vs EXPECTED='$EXPECTED_STATUS', MISMATCHES=${#MISMATCHES[@]}"

# CRITICAL DEBUG: Test the actual condition directly
[[ "${DEBUG:-}" == "true" ]] && echo "  🔧 CRITICAL TEST #1: '$CODE' != '$EXPECTED_STATUS' should be TRUE for failure"
if [[ "$CODE" != "$EXPECTED_STATUS" ]]; then
  [[ "${DEBUG:-}" == "true" ]] && echo "  ✅ CRITICAL #1: Status condition is TRUE - should trigger failure detection"
else
  [[ "${DEBUG:-}" == "true" ]] && echo "  ❌ CRITICAL #1: Status condition is FALSE - BUG DETECTED!"
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 CRITICAL #1: CODE hex: $(echo -n "$CODE" | xxd -p)"
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 CRITICAL #1: EXPECTED hex: $(echo -n "$EXPECTED_STATUS" | xxd -p)"
fi

if [[ "$CODE" != "$EXPECTED_STATUS" || ${#MISMATCHES[@]} -gt 0 ]]; then
  echo "  🚨 FAILURE CONDITION TRIGGERED!"
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

  if [[ "${DEBUG:-}" == "true" ]]; then
    echo "  🚨 Creating failure file: About to create failures directory"
    echo "  📁 Current working directory: $(pwd)"
  fi

  echo "  📁 Always show: Creating failures directory in $(pwd)"
  mkdir -p failures
  
  if [[ "${DEBUG:-}" == "true" ]]; then
    echo "  📁 Failures directory created: $(ls -la failures/ 2>/dev/null || echo 'FAILED')"
  fi
  
  echo "  📁 Always show: failures/ contents after mkdir: $(ls -la failures/ 2>/dev/null || echo 'EMPTY OR FAILED')"
  
  FILENAME="failures/${GROUP}__${NAME}.txt"

  echo "  🚨 Always show: About to create failure file: $FILENAME"

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

  echo "  ✅ Always show: Failure file creation attempted: $FILENAME"
  echo "  📄 Always show: File exists check: $(test -f "$FILENAME" && echo 'YES' || echo 'NO')"
  echo "  📊 Always show: File size: $(wc -c < "$FILENAME" 2>/dev/null || echo 'FAILED') bytes"
  echo "  📁 Always show: failures/ contents after file creation: $(ls -la failures/ || echo 'FAILED')"

  if [[ "${DEBUG:-}" == "true" ]]; then
    echo "  ✅ Failure file created successfully: $FILENAME"
    echo "  📁 File size: $(wc -c < "$FILENAME") bytes"
  fi

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
  
  # Exit with failure code if any checks failed
  exit 1
fi

# Handle ID extraction for CRUD operations before cleanup (only in orchestrated CRUD context)
[[ "${DEBUG:-}" == "true" ]] && echo "  🔍 TRACE: About to handle ID extraction section..."
if [[ "${CRUD_OPERATION:-}" == "create" && -n "${CRUD_GROUP:-}" && -n "${CRUD_STATE_FILE:-}" && -f "tmp_response.json" ]]; then
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔍 TRACE: Starting CRUD ID extraction..."
  [[ "${DEBUG:-}" == "true" ]] && echo "  💾 [CRUD] Extracting ID for CRUD workflow state..." >&2
  
  # Try to extract ID from response
  if jq -e . tmp_response.json >/dev/null 2>&1; then
    # Try to extract ID from direct object (.id)
    extracted_id=$(jq -r '.id // empty' tmp_response.json 2>/dev/null)
    
    # If no direct ID, try to extract from data array (first item)
    if [[ -z "$extracted_id" || "$extracted_id" == "null" ]]; then
      extracted_id=$(jq -r '.data[0].id // empty' tmp_response.json 2>/dev/null)
      [[ -n "$extracted_id" && "$extracted_id" != "null" ]] && [[ "${DEBUG:-}" == "true" ]] && echo "  💾 [CRUD] Extracted ID from data array: $extracted_id" >&2
    fi
    
    if [[ -n "$extracted_id" && "$extracted_id" != "null" ]]; then
      [[ "${DEBUG:-}" == "true" ]] && echo "  💾 [CRUD] Extracted ID: $extracted_id" >&2
      
      # Store ID in state file for use by subsequent CRUD operations
      temp_state=$(jq --arg group "${CRUD_GROUP}" --arg id "$extracted_id" '.[$group] = $id' "${CRUD_STATE_FILE}" 2>/dev/null || echo '{}' | jq --arg group "${CRUD_GROUP}" --arg id "$extracted_id" '.[$group] = $id')
      echo "$temp_state" > "${CRUD_STATE_FILE}"
      [[ "${DEBUG:-}" == "true" ]] && echo "  💾 [CRUD] Stored ID for ${CRUD_GROUP}: $extracted_id" >&2
    else
      [[ "${DEBUG:-}" == "true" ]] && echo "  ⚠️  [CRUD] Could not extract ID from response" >&2
    fi
  else
    [[ "${DEBUG:-}" == "true" ]] && echo "  ⚠️  [CRUD] Response is not valid JSON, cannot extract ID" >&2
  fi
elif [[ "${CRUD_OPERATION:-}" == "create" && -z "${CRUD_GROUP:-}" ]]; then
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔧 [STANDALONE] Individual test - not storing ID for CRUD workflow" >&2
fi

# Clean up temporary files - but preserve tmp_response.json for CRUD ID extraction
if [[ -z "${CRUD_GROUP:-}" ]]; then
  # Not in CRUD mode - safe to clean up
  rm -f tmp_response.json
  [[ "${DEBUG:-}" == "true" ]] && echo "  🧹 [CLEANUP] Removed tmp_response.json (standalone mode)" >&2
else
  # In CRUD mode - preserve tmp_response.json for ID extraction
  [[ "${DEBUG:-}" == "true" ]] && echo "  🔒 [CRUD] Preserving tmp_response.json for ID extraction (group: ${CRUD_GROUP}, operation: ${CRUD_OPERATION})" >&2
fi

# If we reach here, all checks passed

# If we reach here, all checks passed
[[ "${DEBUG:-}" == "true" ]] && echo "  🔍 TRACE: All checks passed, exiting with success code"
exit 0