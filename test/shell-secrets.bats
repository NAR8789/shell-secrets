#!/usr/bin/env bats

HOME="$BATS_TEST_DIRNAME/mock_home"
SRC_PATH="$BATS_TEST_DIRNAME/.."

@test 'load_secrets should load secrets from "$HOME/.shell_secrets.asc' {
  source "$SRC_PATH/shell_secrets.sh"
  [ "$TEST_SECRET" == 'look not upon me!' ]
}
