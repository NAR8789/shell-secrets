#!/usr/bin/env bats

HOME="$BATS_TEST_DIRNAME/mock_home"
SRC_PATH="$BATS_TEST_DIRNAME/.."

@test 'load_secrets should load secrets from "$HOME/.shell_secrets.asc by default' {
  source "$SRC_PATH/shell_secrets.sh"
  load_secrets
  [ "$TEST_SECRET" == 'look not upon me!' ]
}

@test 'shell_secrets.sh should not immediately load secrets' {
  source "$SRC_PATH/shell_secrets.sh"
  [ -z ${TEST_SECRET+x} ]
}

@test 'load_secrets should load secrets from "$SHELL_SECRETS" if provided' {
  SHELL_SECRETS="$HOME/alternate_secrets.asc"
  source "$SRC_PATH/shell_secrets.sh"
  load_secrets
  [ ! "$TEST_SECRET" == 'look not upon me!' ]
  [ "$TEST_SECRET" == 'look neither upon me!' ]
}
