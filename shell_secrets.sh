function load_secrets {
  SHELL_SECRETS="${SHELL_SECRETS:-$HOME/.shell_secrets.asc}"
  if [ -r "$SHELL_SECRETS" ]; then
    eval `gpg -d "$SHELL_SECRETS"`
  fi
}
