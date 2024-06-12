# remote ____________________
alias gr='git remote'
alias gra='gr add'
alias grr='gr rm'
alias grl='gr -v'
alias grs='git remote show | paste -sd " "'

LIST_CMD+=('git remote url to ssh => grus')
grus() {
  local getListRemote=$(git remote)
  local remoteName=$(echo $getListRemote | fzf)
  local getUrl=$(git remote get-url $remoteName)
  local isSshUrl=$(echo $getUrl | grep 'git@')
  if [ -n "$isSshUrl" ]; then
    echo 'youre already ssh url'
  else
    local getSshUrl=$(echo $getUrl | sed -e 's/https:\/\//git@/g' | sed -e 's/\//:/')
    git remote set-url $remoteName $getSshUrl
  fi
}

LIST_CMD+=('git open remote => grb')
grb() {
  local getListRemote=$(git remote)
  local remoteName=$(echo $getListRemote | fzf)
  local getUrl=$(git remote get-url $remoteName)
  local isSshUrl=$(echo $getUrl | grep 'git@')
  if [ -n "$isSshUrl" ]; then
    local changeSshUrl=$(echo $getUrl | sed 's/:/\//g' | sed -e 's/git@/https:\/\//g')
  fi
  xdg-open $changeSshUrl
}

LIST_CMD+=('git delete remote => grm')
grm() {
  local getListRemote=$(git remote)
  local remoteName=$(echo $getListRemote | fzf)
  git remote rm $remoteName
}
