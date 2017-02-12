#!/usr/bin/env bats

load common_env
load file_prefix
LOAD_SECRETS="$BATS_TEST_FILE_PREFIX"

function setup {
  source "$SRC_PATH/shell_secrets.sh"
}

@test "$LOAD_SECRETS should load secrets from \"\$HOME/.shell_secrets.asc\" by default" {
  $LOAD_SECRETS
  [ "$TEST_SECRET" == 'look not upon me!' ]
}

@test "$LOAD_SECRETS should load secrets from \"\$SHELL_SECRETS\" if provided" {
  SHELL_SECRETS="$HOME/alternate_secrets.asc"
  $LOAD_SECRETS
  [ ! "$TEST_SECRET" == 'look not upon me!' ]
  [ "$TEST_SECRET" == 'look neither upon me!' ]
}

@test "$LOAD_SECRETS should not leak environment unnecessarily" {
  $LOAD_SECRETS
  [ -z ${SHELL_SECRETS+x} ]
}
