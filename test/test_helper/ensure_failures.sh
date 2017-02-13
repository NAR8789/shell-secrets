#!/bin/bash

# intended to be executed from base of repo

FAILED_TO_FAIL=0

ARTIFACT_DIR="${ARTIFACT_DIR:-$CIRCLE_ARTIFACTS}"
ARTIFACT_DIR="${ARTIFACT_DIR:-test/artifacts}"
OUTPUT_DIR="$ARTIFACT_DIR/fail_checks"
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

for FAIL_SRC in test/failure_examples/*; do
  FAIL_NAME="$(basename "$FAIL_SRC")"
  SRC_PATH="$FAIL_SRC" bats test 2>"$OUTPUT_DIR/$FAIL_NAME.err.txt" >"$OUTPUT_DIR/$FAIL_NAME.out.txt"
  if [ $? -eq 0 ] ; then
    FAILED_TO_FAIL=1
    printf "\033[0;31mERROR: $FAIL_NAME did not cause a test failure\n"
  else
    printf "\033[0;32m$FAIL_NAME fails tests, as expected\n"
  fi
done

exit $FAILED_TO_FAIL
