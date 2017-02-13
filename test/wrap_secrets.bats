#!/usr/bin/env bats

load test_helper/common_env
load test_helper/file_prefix
WRAP_SECRETS="$BATS_TEST_FILE_PREFIX"

function setup {
  source "$SRC_PATH/shell_secrets.sh"
}

@test "$WRAP_SECRETS should execute the command passed to it" {
  RUN_EVIDENCE="$BATS_TMPDIR/testfunc_ran"
  rm -f "$RUN_EVIDENCE"           # a failed cleanup can result on a messy run tmpdir on the next run

  function testfunc {
    assert_equal "$1" first
    assert_equal "$2" second
    assert_unset $3
    touch "$RUN_EVIDENCE"         # can't rely on variable exports, because $WRAP_SECRETS is designed to clean up state
  }

  $WRAP_SECRETS testfunc first second
  assert [ -r "$RUN_EVIDENCE" ]

  rm "$RUN_EVIDENCE"              # LEAVE NO EVIDENCE!!!
}

@test "secrets should be available within $WRAP_SECRETS, but unavailable outside" {
  function testfunc {
    assert_equal "$TEST_SECRET" 'look not upon me!'
  }

  assert_unset $TEST_SECRET
  $WRAP_SECRETS testfunc
  assert_unset $TEST_SECRET
}

@test "secrets should still be unavailable outside of $WRAP_SECRETS if the wrapped function tries to export the secret" {
  function testfunc {
    export TEST_SECRET
  }

  assert_unset $TEST_SECRET
  $WRAP_SECRETS testfunc
  assert_unset $TEST_SECRET
}
