function tmuxm(){
  local LOC='cd $dr/web/muryp'
  local VIM="$LOC && v"
  local COMPILE="$LOC && yarn dev"
  tmux new-session  \; \
    rename-session 'muryp1'  \; \
    send-keys $VIM C-m  \; \
    rename-window 'editor'  \; \
    new-window  \; \
    rename-window 'issue'  \; \
    send-keys $VIM C-m  \; \
    new-session  \; \
    rename-session 'muryp2'  \; \
    rename-window 'debian'  \; \
    send-keys 'u' C-m  \; \
    new-window  \; \
    rename-window 'compiler' \; \
    send-keys $COMPILE C-m  \; \
}
