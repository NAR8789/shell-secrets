#!/usr/bin/env bats

load common_env
load file_prefix
WRAP_SECRETS="$BATS_TEST_FILE_PREFIX"

function setup {
  source "$SRC_PATH/shell_secrets.sh"
}

@test "$WRAP_SECRETS should execute the command passed to it" {
  function testfunc {
    assert_equal "$1" first
    assert_equal "$2" second
    assert [ -z ${3+x} ]
  }

  $WRAP_SECRETS testfunc first second
}

@test "secrets should be available within $WRAP_SECRETS, but unavailable outside" {
  function testfunc {
    assert_equal "$TEST_SECRET" 'look not upon me!'
  }

  assert [ -z ${TEST_SECRET+x} ]
  $WRAP_SECRETS testfunc
  assert [ -z ${TEST_SECRET+x} ]
}

@test "secrets should still be unavailable outside of $WRAP_SECRETS if the wrapped function tries to export the secret" {
  function testfunc {
    export TEST_SECRET
  }

  assert [ -z ${TEST_SECRET+x} ]
  $WRAP_SECRETS testfunc
  assert [ -z ${TEST_SECRET+x} ]
}
