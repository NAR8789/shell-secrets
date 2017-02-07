if [ -r ~/.shell_secrets.asc ]; then
  eval `gpg2 -d ~/.shell_secrets.asc`
fi
