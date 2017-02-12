#!/bin/bash

# intended to be executed from base of repo

FAILED_TO_FAIL=0

for FAIL_SRC in test/failure_examples/*; do
  echo "$FAIL_SRC"
  if SRC_PATH="$FAIL_SRC" bats test; then
    FAILED_TO_FAIL=1
  fi
done

exit $FAILED_TO_FAIL
