#!/usr/bin/env bats

load common_env
TEST_FILE_NAME="$(basename "$BATS_TEST_FILENAME")"
WRAP_SECRETS="${TEST_FILE_NAME%.*}"

function setup {
  source "$SRC_PATH/shell_secrets.sh"
}

@test "$WRAP_SECRETS should execute the command passed to it" {
  function testfunc {
    [ "$1" == first ]
    [ "$2" == second ]
    [ -z ${3+x} ]
  }

  $WRAP_SECRETS testfunc first second

  unset -f testfunc
}
