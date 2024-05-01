LIST_CMD+=('fzf list history => fh')
fh(){
  local USER_OPTION=$(echo "$(history)" | fzf --tac | sed -e 's/^[[:space:]]*[0-9]\+[[:space:]]*//')
  if [ ! -z "$USER_OPTION" ]; then
    eval $USER_OPTION
  fi
}