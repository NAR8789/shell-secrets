#!/usr/bin/env bats

HOME="$BATS_TEST_DIRNAME/mock_home"
SRC_PATH="$BATS_TEST_DIRNAME/.."

@test 'shell_secrets.sh should not immediately load secrets' {
  source "$SRC_PATH/shell_secrets.sh"
  [ -z ${TEST_SECRET+x} ]
}
