#!/usr/bin/env bats

load common_env
load file_prefix
WRAP_SECRETS="$BATS_TEST_FILE_PREFIX"

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
}

@test "secrets should be available within $WRAP_SECRETS, but unavailable outside" {
  function testfunc {
    [ "$TEST_SECRET" == 'look not upon me!' ]
  }

  [ -z ${TEST_SECRET+x} ]
  $WRAP_SECRETS testfunc
  [ -z ${TEST_SECRET+x} ]
}

@test "secrets should still be unavailable outside of $WRAP_SECRETS if the wrapped function tries to export the secret" {
  function testfunc {
    export TEST_SECRET
  }

  [ -z ${TEST_SECRET+x} ]
  $WRAP_SECRETS testfunc
  [ -z ${TEST_SECRET+x} ]
}
