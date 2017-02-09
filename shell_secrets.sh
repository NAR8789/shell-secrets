function load_secrets {
  if [ -r "$HOME/.shell_secrets.asc" ]; then
    eval `gpg -d "$HOME/.shell_secrets.asc"`
  fi
}
