if [ -r "$HOME/.shell_secrets.asc" ]; then
  eval `gpg2 -d "$HOME/.shell_secrets.asc"`
fi
