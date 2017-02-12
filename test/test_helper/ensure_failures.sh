#!/bin/bash

# intended to be executed from base of repo

for FAIL_SRC in test/failure_examples/*; do
  echo "$FAIL_SRC"
  SRC_PATH="$FAIL_SRC" bats test
done
