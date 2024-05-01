LIST_CMD+=('fzf list help => mans')
mans(){
  local LIST_HELP=$(man -k . | cut -d '(' -f1 | fzf -m --preview 'man {1}')
  if [ ! -z "$LIST_HELP" ]; then
    nvim -c ":Man ${LIST_HELP}" -c ":only"
  fi
}