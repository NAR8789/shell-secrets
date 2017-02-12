#!/bin/bash


# Fail and display details if the expected and actual values equal
#
# Globals:
#   none
# Arguments:
#   $1 - actual value
#   $2 - refuted value
# Returns:
#   1 - values equal
#   0 - otherwise
# Outputs:
#   STDERR - details, on failure
function refute_equal {
  if [[ $1 == "$2" ]]; then
    batslib_print_kv_single_or_multi 8 \
        'refuted' "$2" \
        'actual'  "$1" \
      | batslib_decorate 'values equal when they should not' \
      | fail
  fi
}

function assert_unset {
  assert [ -z ${1+x} ]
}
