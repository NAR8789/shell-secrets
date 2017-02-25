#!/bin/bash

load test_helper/bats-support/load
load test_helper/bats-assert/load

load test_helper/extra_assert

HOME="$BATS_TEST_DIRNAME/mock_home"
SRC_PATH="${SRC_PATH:-$BATS_TEST_DIRNAME/..}"

gpg() {
  2>/dev/null /usr/bin/env gpg "$@"
}
