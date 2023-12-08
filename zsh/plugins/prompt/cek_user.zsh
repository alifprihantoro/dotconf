CEK_USER() {
  if [[ "$(whoami)" == "root" ]]; then
    echo -n "#"
  else
    echo -n "$"
  fi
}
