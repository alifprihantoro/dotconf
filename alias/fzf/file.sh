LIST_CMD+=('fzf open with nvim => vf')
vf() {
  FILEFUZZY nvim
}
LIST_CMD+=('find dir by .ext => vfe')
vfe() {
  vim_w_fzf=$(find *.$1 -type f | fzf >selected)
  while [ "$vim_w_fzf" != "" ]; do
    nvim $vim_w_fzf
    break
  done
}
LIST_CMD+=('fzf cd folder => cf')
cf() {
  local list_dir=$(find . -maxdepth 1 -type d,l -name "*" -print)
  local cd_w_fzf=$(echo -e "$list_dir\n.." | fzf)
  if [ ! -z "$cd_w_fzf" ]; then
    if [ "$cd_w_fzf" = "." ]; then
      echo "you're in $(pwd)"
    else
      cd $cd_w_fzf
      cf
    fi
  fi
}
LIST_CMD+=('find project => cfp')
alias cfpp='cfp && cf'
LIST_CMD+=('cfp then cf => cfpp')
# split with ' => '
cfp() {
  # sed change path $HOME to ''
  local LIST=$(printf '%s\n' "${LIST_PROJECT[@]}" | sed "s#$HOME//##g")
  local DIR=$(echo "$LIST" | fzf | awk -F' => ' '{print $2}')
  if [ ! -z "$DIR" ]; then
    local CMD="cd $HOME/$DIR"
    addHistory $CMD
    eval $CMD
    cf
  fi
}
LIST_CMD+=('fzf list git => cfg')
alias cfg='
cd $(find ~/. -type d -name .git -prune -exec dirname {} \; | fzf)
'
