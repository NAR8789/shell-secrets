#!/bin/bash

# grab the filename without extension. 

TEST_FILE_NAME="$(basename "$BATS_TEST_FILENAME")"
BATS_TEST_FILE_PREFIX="${TEST_FILE_NAME%.*}"
