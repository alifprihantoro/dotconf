alias tmuxa='tmux attach'
alias tmuxk='tmux kill-server'
addNewTmux() {
  echo "new-window -n \"$1\" -c \"#{pane_current_path}\" \\;"
  if [ "$2" != "" ]; then
    echo "send-keys $2 C-m \\; "
  fi
}

LIST_TMUX=('BLANK => tmux rename-session "home"')
LIST_TMUX+=('TMUX QUEST => tmuxq')
tmuxq() {
  local DEFAULT_PATH="$dw/quest"
  local COMPILE="pnpm dev"
  local NAME_SESSION='quest'
  local NAME_FIRST_WINDOW='editor'
  local FIRST_CMD="cd $DEFAULT_PATH && v"
  # first cmd/window
  local ARGS="rename-session $NAME_SESSION \; "
  ARGS+="rename-window $NAME_FIRST_WINDOW  \; "
  ARGS+="send-keys T_CMD C-m  \; "
  # second cmd
  ARGS+=$(addNewTmux "issue" "v")
  ARGS+=$(addNewTmux "compile" $COMPILE)
  ARGS+=$(addNewTmux "proot" "u C-m sta")
  ARGS="tmux $(echo $ARGS | tr '\n' ' ')"
  eval $ARGS
}

LIST_TMUX+=('TMUX WEB => tmuxq')
tmuxw() {
  local DEFAULT_PATH="$dw/alifprihantoro"
  local COMPILE="pnpm dev:home"
  local NAME_SESSION='web'
  local NAME_FIRST_WINDOW='editor'
  local FIRST_CMD="cd $DEFAULT_PATH && v"
  # first cmd/window
  local ARGS="rename-session $NAME_SESSION \; "
  ARGS+="rename-window $NAME_FIRST_WINDOW  \; "
  ARGS+="send-keys T_CMD C-m  \; "
  # second cmd
  ARGS+=$(addNewTmux "issue" "v")
  ARGS+=$(addNewTmux "compile" $COMPILE)
  ARGS+=$(addNewTmux "proot" "u C-m sta")
  ARGS="tmux $(echo $ARGS | tr '\n' ' ')"
  eval $ARGS
}

tmuxl() {
  local LIST_TMUX=$(printf '%s\n' "${LIST_TMUX[@]}")
  eval $(echo $LIST_TMUX | fzf | sed 's/.*=> //')
}
