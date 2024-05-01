fcmd(){
  local LIST_CMD=$(printf '%s\n' "${LIST_CMD[@]}")
  echo $LIST_CMD | fzf
}