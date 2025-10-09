#!/bin/bash
# Usage: ./link_endpoints.sh README.md openapi/openapi.yaml

README="$1"
OPENAPI="$2"
BRANCH="main"

TMP_README="${README}.tmp"
cp "$README" "$TMP_README"

ROUTE_REGEX='^[-*] (GET|POST|PUT|DELETE|PATCH)? ?(\[)?(/[^ ]+):?(\])?(\(openapi/openapi.yaml#L[0-9]+\))?:'


{
  while IFS= read -r line; do
    if [[ $line =~ \[([^\]]+)\]\(openapi/openapi.yaml#L[0-9]+\) ]]; then
      ROUTE="${BASH_REMATCH[1]}"
      LINE_NUM=$(grep -n "^[[:space:]]*$ROUTE" "$OPENAPI" | cut -d: -f1 | head -n1)
      if [ ! -z "$LINE_NUM" ]; then
        METHOD=$(echo "$line" | grep -oE 'GET|POST|PUT|DELETE|PATCH')
        echo "- $METHOD [$ROUTE](openapi/openapi.yaml#L$LINE_NUM):"
        continue
      fi
    fi
    if [[ $line =~ -[[:space:]]*(GET|POST|PUT|DELETE|PATCH)[[:space:]]+(/[^ ]+): ]]; then
      ROUTE="${BASH_REMATCH[2]}:"
      LINE_NUM=$(grep -n "^[[:space:]]*$ROUTE" "$OPENAPI" | cut -d: -f1 | head -n1)
      if [ ! -z "$LINE_NUM" ]; then
        METHOD="${BASH_REMATCH[1]}"
        echo "- $METHOD [$ROUTE](openapi/openapi.yaml#L$LINE_NUM):"
        continue
      fi
    fi
    echo "$line"
  done < "$README"
} > "$TMP_README"

mv "$TMP_README" "$README"
echo "Add links to $README."
