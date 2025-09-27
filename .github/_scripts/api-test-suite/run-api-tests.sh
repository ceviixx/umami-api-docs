#!/bin/bash

set -euo pipefail

# Orchestrated API Testing Script
# This script executes CRUD operations in the correct order and manages IDs between requests

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEST_ENDPOINT_SCRIPT="$SCRIPT_DIR/test-endpoint-enhanced.sh"
CRUD_CONFIG="$SCRIPT_DIR/crud-mapping.json"
STATE_FILE="$SCRIPT_DIR/test-state.json"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[ORCHESTRATOR]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Initialize state file
init_state() {
    echo '{}' > "$STATE_FILE"
}

# Extract ID from JSON response
extract_id() {
    local response_file="$1"
    local id_path="$2"
    
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Extracting ID from $response_file using path: $id_path" >&2
    
    if [[ ! -f "$response_file" ]]; then
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Response file not found: $response_file" >&2
        error "Response file not found: $response_file"
        return 1
    fi
    
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Response file content: $(cat "$response_file")" >&2
    
    # Try to extract ID using jq
    local extracted_id
    # Use set -f to disable globbing temporarily for this operation
    set -f
    
    # Construct the full jq path
    local jq_path=".$id_path"
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Input id_path: '$id_path'" >&2
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Constructed jq_path: '$jq_path'" >&2
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Executing: jq -r \"$jq_path\" \"$response_file\"" >&2
    
    if extracted_id=$(jq -r "$jq_path" "$response_file" 2>/dev/null) && [[ "$extracted_id" != "null" && -n "$extracted_id" ]]; then
        set +f
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Successfully extracted ID: $extracted_id" >&2
        echo "$extracted_id"
        return 0
    fi
    set +f
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Primary extraction failed, extracted_id='$extracted_id'" >&2
    
    # For array paths, check if array is empty
    if [[ "$id_path" == *"["* ]]; then
        local array_path="${id_path%%[*}"  # Extract "data" from "data[0].id"
        local array_length
        if array_length=$(jq -r ".$array_path | length" "$response_file" 2>/dev/null); then
            [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Array '$array_path' has length: $array_length" >&2
            if [[ "$array_length" == "0" ]]; then
                [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Array is empty - no items to extract ID from" >&2
                error "No items in response array to extract ID from"
                return 1
            fi
        fi
    fi
    
    # Fallback: try to extract first ID-like string
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Trying fallback extraction..." >&2
    if extracted_id=$(jq -r '.. | select(type == "string" and test("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))' "$response_file" 2>/dev/null | head -n1) && [[ -n "$extracted_id" ]]; then
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] Fallback extraction successful: $extracted_id" >&2
        echo "$extracted_id"
        return 0
    fi
    
    [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-EXTRACT-ID] All extraction methods failed" >&2
    error "Could not extract ID from response"
    return 1
}

# Store ID in state
store_id() {
    local group="$1"
    local id="$2"
    
    local temp_state
    temp_state=$(jq --arg group "$group" --arg id "$id" '.[$group] = $id' "$STATE_FILE")
    echo "$temp_state" > "$STATE_FILE"
    [[ "${DEBUG:-}" == "true" ]] && log "Stored ID for $group: $id"
}

# Get ID from state
get_id() {
    local group="$1"
    jq -r --arg group "$group" '.[$group] // empty' "$STATE_FILE"
}

# Replace placeholders in file path with actual IDs
replace_placeholders() {
    local file_path="$1"
    local group="$2"
    
    # Replace :groupId with actual ID
    case "$group" in
        "teams")
            local team_id
            team_id=$(get_id "teams")
            if [[ -n "$team_id" ]]; then
                file_path="${file_path//:teamId/$team_id}"
            fi
            ;;
        "users")
            local user_id
            user_id=$(get_id "users")
            if [[ -n "$user_id" ]]; then
                file_path="${file_path//:userId/$user_id}"
            fi
            ;;
        "websites")
            local website_id
            website_id=$(get_id "websites")
            if [[ -n "$website_id" ]]; then
                file_path="${file_path//:websiteId/$website_id}"
            fi
            ;;
        "reports")
            local report_id
            report_id=$(get_id "reports")
            if [[ -n "$report_id" ]]; then
                file_path="${file_path//:reportId/$report_id}"
            fi
            ;;
        "sessions")
            local session_id
            session_id=$(get_id "sessions")
            if [[ -n "$session_id" ]]; then
                file_path="${file_path//:sessionId/$session_id}"
            fi
            ;;
    esac
    
    echo "$file_path"
}

# Execute a single endpoint test
execute_endpoint() {
    local file_path="$1"
    local group="$2"
    local operation="$3"
    
    if [[ ! -f "$file_path" ]]; then
        error "Documentation file not found: $file_path"
        return 1
    fi
    
    log "Executing $group/$operation: $file_path"
    
    # Create temporary response file
    local temp_response="tmp_response_${group}_${operation}.json"
    
    # Set environment variables for the test script
    export CRUD_GROUP="$group"
    export CRUD_OPERATION="$operation"
    export CRUD_STATE_FILE="$STATE_FILE"
    
    # Execute the test
    local test_result=0
    set +e  # Temporarily disable exit on error
    bash "$TEST_ENDPOINT_SCRIPT" "$file_path"
    test_result=$?
    set -e  # Re-enable exit on error
    
    if [[ $test_result -eq 0 ]]; then
        success "$group/$operation completed successfully"
    else
        error "$group/$operation failed"
    fi
    
    # Check if this operation needs an ID from a dependency
    local id_dependencies
    id_dependencies=$(jq -r --arg group "$group" --arg op "$operation" '.crud_groups[$group].id_dependencies[$op] // empty' "$CRUD_CONFIG" 2>/dev/null)
    
    if [[ -n "$id_dependencies" && "$id_dependencies" != "null" ]]; then
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-DEPENDENCY] Operation $operation depends on: $id_dependencies"
        # Check if dependency ID is available
        local dependency_id
        dependency_id=$(jq -r --arg group "$group" '.[$group] // empty' "$STATE_FILE" 2>/dev/null)
        if [[ -z "$dependency_id" || "$dependency_id" == "null" ]]; then
            [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-DEPENDENCY] Warning: No ID available from dependency operations for $group/$operation"
        else
            [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-DEPENDENCY] Using existing ID: $dependency_id"
        fi
    fi
    
    # If this is a create or list operation, try to extract and store the ID even if test failed
    if [[ ("$operation" == "create" || "$operation" == "list") && -f "tmp_response.json" ]]; then
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] Starting ID extraction for $group/$operation"
        local id_path
        id_path=$(jq -r --arg group "$group" '.crud_groups[$group].id_extraction_path' "$CRUD_CONFIG")
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] ID path for $group: $id_path"
        
        if [[ "$id_path" != "null" ]]; then
            [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] Attempting to extract ID using path: $id_path for $operation operation"
            local extracted_id
            if extracted_id=$(extract_id "tmp_response.json" "$id_path"); then
                store_id "$group" "$extracted_id"
                [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] Successfully extracted and stored ID for $group: $extracted_id"
            else
                warning "Could not extract ID from $operation response for $group"
                [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] ID extraction failed, response content: $(cat tmp_response.json)"
                
                # For sessions, fall back to static TEST_SESSION_ID if extraction fails
                if [[ "$group" == "sessions" ]]; then
                    local fallback_id="${TEST_SESSION_ID:-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}"
                    store_id "$group" "$fallback_id"
                    warning "Using static TEST_SESSION_ID as fallback: $fallback_id"
                fi
            fi
        else
            [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] No ID extraction path configured for $group"
        fi
    else
        [[ "${DEBUG:-}" == "true" ]] && echo "[DEBUG-ID-EXTRACTION] Skipping ID extraction: operation=$operation, tmp_response.json exists=$(test -f "tmp_response.json" && echo "yes" || echo "no")"
    fi
    
    return $test_result
}

# Test a CRUD group
test_crud_group() {
    local group="$1"
    
    log "Starting CRUD test sequence for group: $group"
    
    # Get test order for this group
    local operations
    operations=$(jq -r --arg group "$group" '.test_order[$group][]' "$CRUD_CONFIG")
    
    local failed_operations=()
    
    for operation in $operations; do
        # Get file path for this operation
        local file_path
        file_path=$(jq -r --arg group "$group" --arg op "$operation" '.crud_groups[$group][$op]' "$CRUD_CONFIG")
        
        if [[ "$file_path" == "null" ]]; then
            warning "No file defined for $group/$operation, skipping"
            continue
        fi
        
        # Replace placeholders if needed (for update, delete operations)
        file_path=$(replace_placeholders "$file_path" "$group")
        
        if ! execute_endpoint "$file_path" "$group" "$operation"; then
            failed_operations+=("$operation")
            
            # If create fails, skip the rest of the group
            if [[ "$operation" == "create" ]]; then
                error "Create operation failed for $group, skipping remaining operations"
                break
            fi
        fi
    done
    
    if [[ ${#failed_operations[@]} -eq 0 ]]; then
        success "All operations completed successfully for group: $group"
        return 0
    else
        error "Failed operations in $group: ${failed_operations[*]}"
        return 1
    fi
}

# Test standalone endpoints
test_standalone_endpoints() {
    log "Testing standalone endpoints"
    
    local endpoints
    endpoints=$(jq -r '.standalone_endpoints[]' "$CRUD_CONFIG")
    
    local failed_endpoints=()
    
    for endpoint in $endpoints; do
        if [[ -f "$endpoint" ]]; then
            if ! execute_endpoint "$endpoint" "standalone" "get"; then
                failed_endpoints+=("$endpoint")
            fi
        else
            warning "Standalone endpoint file not found: $endpoint"
        fi
    done
    
    if [[ ${#failed_endpoints[@]} -eq 0 ]]; then
        success "All standalone endpoints completed successfully"
        return 0
    else
        error "Failed standalone endpoints: ${failed_endpoints[*]}"
        # Log failures but don't stop processing - failures will be handled by issue system
        log "🔄 Continuing despite failures - they will be processed for issue creation"
        return 1  # Return 1 to indicate failures, but main script will handle gracefully
    fi
}

# Main execution function
main() {
    local test_type="${1:-all}"
    
    log "Starting orchestrated API tests"
    log "Test type: $test_type"
    
    # Clean up old failure files to prevent false positives
    log "Cleaning up old failure files"
    rm -rf failures/
    mkdir -p failures/
    
    # Initialize state
    init_state
    
    # Check if required files exist
    if [[ ! -f "$TEST_ENDPOINT_SCRIPT" ]]; then
        error "Test endpoint script not found: $TEST_ENDPOINT_SCRIPT"
        exit 1
    fi
    
    if [[ ! -f "$CRUD_CONFIG" ]]; then
        error "CRUD configuration not found: $CRUD_CONFIG"
        exit 1
    fi
    
    local failed_groups=()
    
    case "$test_type" in
        "all")
            # Test CRUD groups
            local groups
            groups=$(jq -r '.crud_groups | keys[]' "$CRUD_CONFIG")
            
            for group in $groups; do
                if ! test_crud_group "$group"; then
                    failed_groups+=("$group")
                fi
                echo # Add spacing between groups
            done
            
            # Test standalone endpoints
            if ! test_standalone_endpoints; then
                failed_groups+=("standalone")
            fi
            ;;
        "crud")
            # Only test CRUD groups
            local groups
            groups=$(jq -r '.crud_groups | keys[]' "$CRUD_CONFIG")
            
            for group in $groups; do
                if ! test_crud_group "$group"; then
                    failed_groups+=("$group")
                fi
                echo
            done
            ;;
        "standalone")
            # Only test standalone endpoints
            if ! test_standalone_endpoints; then
                failed_groups+=("standalone")
            fi
            ;;
        *)
            # Test specific group
            if jq -e --arg group "$test_type" '.crud_groups | has($group)' "$CRUD_CONFIG" >/dev/null; then
                if ! test_crud_group "$test_type"; then
                    failed_groups+=("$test_type")
                fi
            else
                error "Unknown test type or group: $test_type"
                exit 1
            fi
            ;;
    esac
    
    # Summary
    echo
    
    # Debug: Check for failure files
    if [[ -d "failures" ]]; then
        failure_count=$(find failures -type f -name "*.txt" | wc -l)
        log "🔍 Found $failure_count failure files in failures/ directory"
        if [[ $failure_count -gt 0 ]]; then
            log "📋 Failure files:"
            find failures -type f -name "*.txt" -exec basename {} \; | head -5
        fi
    else
        log "⚠️ No failures/ directory found"
    fi
    
    if [[ ${#failed_groups[@]} -eq 0 ]]; then
        success "🎉 All tests completed successfully!"
        exit 0
    else
        error "❌ Some tests failed in groups: ${failed_groups[*]}"
        # Don't exit with error code - let GitHub Actions handle the failure reporting
        # and continue to allow failure artifacts to be processed
        if [[ "${CI:-}" == "true" ]]; then
            log "🔄 Running in CI - continuing for failure processing"
            exit 0
        else
            exit 1
        fi
    fi
}

# Help function
show_help() {
    echo "Usage: $0 [test_type]"
    echo ""
    echo "Test types:"
    echo "  all         - Run all tests (CRUD groups + standalone endpoints) [default]"
    echo "  crud        - Run only CRUD group tests"
    echo "  standalone  - Run only standalone endpoint tests"
    echo "  teams       - Run only teams CRUD tests"
    echo "  users       - Run only users CRUD tests"
    echo "  websites    - Run only websites CRUD tests"
    echo "  reports     - Run only reports CRUD tests"
    echo ""
    echo "Examples:"
    echo "  $0                    # Run all tests"
    echo "  $0 crud              # Run only CRUD tests"
    echo "  $0 teams             # Run only teams CRUD sequence"
    echo ""
}

# Check for help flag
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    show_help
    exit 0
fi

# Run main function
main "${1:-all}"