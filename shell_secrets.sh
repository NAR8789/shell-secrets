function load_secrets {
  SHELL_SECRETS="${SHELL_SECRETS:-$HOME/.shell_secrets.asc}"
  if [ -r "$SHELL_SECRETS" ]; then
    eval `gpg -d "$SHELL_SECRETS"`
  fi
}

# I would much rather this be an alias.  Unfortunately I can't seem
# to test aliases with BATS... no alias expansion in noninteractive shells.
# TODO: figure out how to test aliases with BATS
function los {
  load_secrets "$@"
}
