#!/usr/bin/env bats

load test_helper/common_env

@test 'shell_secrets.sh should not immediately load secrets' {
  source "$SRC_PATH/shell_secrets.sh"
  assert_unset $TEST_SECRET
}
