function load_secrets {
  local SHELL_SECRETS="$HOME/.shell_secrets.asc"
  if [ -r "$SHELL_SECRETS" ]; then
    eval `gpg -d "$SHELL_SECRETS"`
  fi
}

# I would much rather this be an alias. See https://github.com/NAR8789/shell-secrets/issues/12
function los { load_secrets "$@"; }

function wrap_secrets {
  (
    load_secrets
    "$@"
  )
}

# I would much rather this be an alias. See https://github.com/NAR8789/shell-secrets/issues/12
function ws { wrap_secrets "$@"; }
