function load_secrets {
  local SHELL_SECRETS="${SHELL_SECRETS:-$HOME/.shell_secrets.asc}"
}

# I would much rather this be an alias. See https://github.com/NAR8789/shell-secrets/issues/12
function los { load_secrets "$@"; }

function with_secrets {
  (
    load_secrets
    "$@"
  )
}

# I would much rather this be an alias. See https://github.com/NAR8789/shell-secrets/issues/12
function ws { with_secrets "$@"; }
