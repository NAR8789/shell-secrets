#!/usr/bin/env bats

load test_helper/common_env
load test_helper/file_prefix
LOAD_SECRETS="$BATS_TEST_FILE_PREFIX"

function setup {
  source "$SRC_PATH/shell_secrets.sh"
}

@test "$LOAD_SECRETS should load secrets from \"\$HOME/.shell_secrets.asc\" by default" {
  $LOAD_SECRETS
  assert_equal "$TEST_SECRET" 'look not upon me!'
}

@test "$LOAD_SECRETS should load secrets from \"\$SHELL_SECRETS\" if provided" {
  SHELL_SECRETS="$HOME/alternate_secrets.asc"
  $LOAD_SECRETS
  refute_equal "$TEST_SECRET" 'look not upon me!'
  assert_equal "$TEST_SECRET" 'look neither upon me!'
}

@test "$LOAD_SECRETS still works correctly when \"\$SHELL_SECRETS\" contains spaces" {
  SHELL_SECRETS="$HOME/s p a c e secrets.asc"
  $LOAD_SECRETS
  assert_equal "$SPACE_SECRET" 'the terrible secret of space!'
}

@test "$LOAD_SECRETS should not leak environment unnecessarily" {
  $LOAD_SECRETS
  assert_unset $SHELL_SECRETS
}
