#!/bin/bash

load test_helper/bats-support/load
load test_helper/bats-assert/load

HOME="$BATS_TEST_DIRNAME/mock_home"
SRC_PATH="${SRC_PATH:-$BATS_TEST_DIRNAME/..}"
