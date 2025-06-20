#!/bin/bash

# Exit immediately on error, undefined variable, or pipe failure
set -euo pipefail

# Input parameters
ENTRY="$1"
GROUP="$2"

# Extract test name and whether it should be executed
NAME=$(echo "$ENTRY" | jq -r '.name')
SHOULD_TEST=$(echo "$ENTRY" | jq -r 'if .testing == false then "false" else "true" end')

# Skip test if disabled
if [[ "$SHOULD_TEST" != "true" ]]; then
  echo "⏭️  Skipping $GROUP/$NAME"
  exit 0
else
  echo "✅ Testing $GROUP/$NAME"
fi

# Extract method, route, body, headers, expected status and expected body
METHOD=$(echo "$ENTRY" | jq -r '.method')
ROUTE=$(echo "$ENTRY" | jq -r '.route' | envsubst)
RAW_BODY=$(echo "$ENTRY" | jq -c '.body // empty')
BODY=$(echo "$RAW_BODY" | envsubst)
HEADERS=$(echo "$ENTRY" | jq -c '.headers // {}')
EXPECTED=$(echo "$ENTRY" | jq -r '.expectedStatus // 200')
EXPECTED_BODY=$(echo "$ENTRY" | jq -c '.expectedBody // empty')

# Construct full URL
if [[ "$ROUTE" == http*://* ]]; then
  URL="$ROUTE"
else
  URL="$BASE_URL$ROUTE"
fi

# Secrets to be masked in logs
SECRETS_TO_MASK=("$TEST_WEBSITE_ID" "$TEST_SESSION_ID" "$API_KEY")

# Replace secret values with placeholders
redact_secrets() {
  local content="$1"
  for secret in "${SECRETS_TO_MASK[@]}"; do
    if [ -n "$secret" ]; then
      content=$(echo "$content" | sed "s|$secret|xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx|g")
    fi
  done
  echo "$content"
}

# Replace sensitive values in response (e.g. usernames, domains)
anonymize_response_values() {
  local json="$1"
  echo "$json" |
    jq 'walk(
      if type == "object" then
        with_entries(
          if .key == "name"
            or .key == "domain"
            or .key == "shareId"
            or .key == "username"
          then .value |= "*****"
          else .
          end
        )
      else
        .
      end
    )' 2>/dev/null |
    sed -E 's/[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/*****-****-****-****-************/g'
}

MISMATCHES=()

# Recursively compare expected vs actual JSON types
check_types_recursive() {
  local expected="$1"
  local actual="$2"
  local path="${3:-root}"

  local expected_type
  expected_type=$(echo "$expected" | jq -r 'if type == "string" then . elif type == "object" and .type then .type else type end')
  local actual_type
  actual_type=$(echo "$actual" | jq -r 'type')

  # Handle arrays
  if [[ "$expected_type" == "array" ]]; then
    if [[ "$actual_type" != "array" ]]; then
      TMP_MISMATCHES+=("Key '$path': Type mismatch – expected array but got $actual_type")
      return 1
    fi

    local expected_item
    expected_item=$(echo "$expected" | jq -c 'if type == "array" then .[0] elif type == "object" then .items[0] else empty end')

    # If object structure, wrap in properties
    if [[ "$(echo "$expected_item" | jq 'type')" == '"object"' ]]; then
      has_type=$(echo "$expected_item" | jq 'has("type")')
      has_non_type_keys=$(echo "$expected_item" | jq 'keys | map(select(. != "type" and . != "optional")) | length')
      if [[ "$has_type" == "true" && "$has_non_type_keys" -eq 0 ]]; then :; else
        expected_item="{\"type\": \"object\", \"properties\": $expected_item }"
      fi
    fi

    local length
    length=$(echo "$actual" | jq 'length')
    if (( length == 0 )); then
      return 0
    fi

    for i in $(seq 0 $((length - 1))); do
      local actual_item
      actual_item=$(echo "$actual" | jq -c ".[$i]")
      INNER_MISMATCHES=()
      if ! check_types_recursive "$expected_item" "$actual_item" "$path[$i]"; then
        for m in "${INNER_MISMATCHES[@]}"; do TMP_MISMATCHES+=("$m"); done
        return 1
      fi
    done
    return 0
  fi

  # Handle objects
  if [[ "$expected_type" == "object" ]]; then
    if [[ "$actual_type" != "object" ]]; then
      TMP_MISMATCHES+=("Key '$path': Type mismatch – expected object but got $actual_type")
      return 1
    fi

    if echo "$expected" | jq -e 'has("properties")' >/dev/null; then
      expected=$(echo "$expected" | jq -c '.properties')
    fi

    local keys has_errors=0
    keys=$(echo "$expected" | jq -r 'keys_unsorted[]')
    for key in $keys; do
      local exp_sub act_sub is_optional
      exp_sub=$(echo "$expected" | jq -c --arg key "$key" '.[$key]')
      has_key=$(echo "$actual" | jq -e --arg key "$key" 'has($key)') || has_key="false"
      is_optional=$(echo "$exp_sub" | jq -r 'if type == "object" and .optional == true then "true" else "false" end')

      if [[ "$has_key" != "true" ]]; then
        if [[ "$is_optional" == "true" ]]; then
          continue
        else
          TMP_MISMATCHES+=("Key '$path.$key': Missing required key")
          has_errors=1
          continue
        fi
      fi

      act_sub=$(echo "$actual" | jq -c --arg key "$key" '.[$key]')

      INNER_MISMATCHES=()
      if ! check_types_recursive "$exp_sub" "$act_sub" "$path.$key"; then
        for m in "${INNER_MISMATCHES[@]}"; do TMP_MISMATCHES+=("$m"); done
        has_errors=1
      fi
    done

    if [[ "$has_errors" -eq 1 ]]; then return 1; fi
    return 0
  fi

  # Compare primitive types
  if [[ "$expected_type" != "$actual_type" ]]; then
    local is_optional
    is_optional=$(echo "$expected" | jq -r 'if type == "object" and .optional == true then "true" else "false" end')

    if [[ "$actual_type" == "null" && "$is_optional" == "true" ]]; then return 0; fi

    local actual_value_str
    actual_value_str=$(echo "$actual" | jq -c '.' 2>/dev/null || echo "<unreadable>")
    TMP_MISMATCHES+=("Key '${path}': Type mismatch – expected ${expected_type:-<unknown>} but got ${actual_type:-<unknown>} (value: ${actual_value_str})")
    return 1
  fi

  return 0
}

# Build curl request
CURL_ARGS=(-s -w "%{http_code}" -o tmp_response.json -X "$METHOD" "$URL")

# Add headers
while read -r row; do
  KEY=$(echo "$row" | jq -r '.key')
  VAL=$(echo "$row" | jq -r '.value')
  [[ "$VAL" == *'$'* ]] && VAL=$(eval echo "\"$VAL\"")
  CURL_ARGS+=("-H" "$KEY: $VAL")
done < <(echo "$HEADERS" | jq -c '. | to_entries[]')

# Check if request body should be sent
SEND_BODY=false
[[ -n "$BODY" && "$METHOD" != "GET" ]] && SEND_BODY=true

# Perform request and capture HTTP status code
if [[ "$SEND_BODY" == "true" ]]; then
  CODE=$(printf "%s" "$BODY" | curl --data "@-" "${CURL_ARGS[@]}")
else
  CODE=$(curl "${CURL_ARGS[@]}")
fi

# Read response body
BODY_TEXT=$(cat tmp_response.json)

# Validate JSON
IS_VALID_JSON=false
ACTUAL_BODY=""
if jq -e . tmp_response.json >/dev/null 2>&1; then
  ACTUAL_BODY=$(jq -c . tmp_response.json)
  IS_VALID_JSON=true
fi

# Compare expected vs actual body structure
BODY_MISMATCH=false
if [[ -n "$EXPECTED_BODY" && "$IS_VALID_JSON" == true ]]; then
  EXPECTED_BODY_TYPE=$(echo "$EXPECTED_BODY" | jq -r 'type')
  ACTUAL_BODY_TYPE=$(echo "$ACTUAL_BODY" | jq -r 'type')

  TMP_MISMATCHES=()
  if [[ "$EXPECTED_BODY_TYPE" == "array" && "$ACTUAL_BODY_TYPE" == "array" ]]; then
    if ! check_types_recursive "$EXPECTED_BODY" "$ACTUAL_BODY" "root"; then
      BODY_MISMATCH=true
    fi
  elif [[ "$EXPECTED_BODY_TYPE" == "object" && "$ACTUAL_BODY_TYPE" == "object" ]]; then
    if ! check_types_recursive "$EXPECTED_BODY" "$ACTUAL_BODY" "root"; then
      BODY_MISMATCH=true
    fi
  fi
  MISMATCHES+=("${TMP_MISMATCHES[@]}")
elif [[ -n "$EXPECTED_BODY" && "$IS_VALID_JSON" == false ]]; then
  BODY_MISMATCH=true
fi

# Save failure report if status or structure mismatch
if [[ "$CODE" != "$EXPECTED" || "$BODY_MISMATCH" == "true" ]]; then
  mkdir -p failures
  FILENAME="failures/$(echo "$GROUP" | tr '/' '_')__$(echo "$NAME" | tr '/' '_').txt"
  {
    echo "Group: $GROUP"
    echo "Name: $NAME"
    echo "Method: $METHOD"
    echo "Route: $(redact_secrets "$ROUTE")"
    echo "Expected Status: $EXPECTED"
    echo "Actual Status: $CODE"
    echo
    echo "Request Body:"
    echo "$(anonymize_response_values "$(redact_secrets "$BODY")")"
    echo
    echo "Response Body:"
    echo "$(anonymize_response_values "$(redact_secrets "$BODY_TEXT")")"
    if [[ "$BODY_MISMATCH" == "true" ]]; then
      echo
      echo "Expected Body (types):"
      echo "$(redact_secrets "$EXPECTED_BODY")"
      if [[ ${#MISMATCHES[@]} -gt 0 ]]; then
        echo
        echo "Type mismatches:"
        for m in "${MISMATCHES[@]}"; do
          echo "$m"
        done
      fi
    fi
  } > "$FILENAME"
fi