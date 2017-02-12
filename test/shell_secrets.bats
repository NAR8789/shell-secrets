#!/usr/bin/env bats

load common_env

@test 'shell_secrets.sh should not immediately load secrets' {
  source "$SRC_PATH/shell_secrets.sh"
  assert [ -z ${TEST_SECRET+x} ]
}
