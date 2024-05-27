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
  local getSshUrl=$(echo $getUrl | sed 's/git@/ssh:\/\/git@/g' | sed 's/:/\//g')
  git remote set-url $remoteName $getSshUrl
}

LIST_CMD+=('git open remote => grb')
grb() {
  local getListRemote=$(git remote)
  local remoteName=$(echo $getListRemote | fzf)
  local getUrl=$(git remote get-url $remoteName)
  local changeSshUrl=$(echo $getUrl | sed 's/git@/ssh:\/\/git@/g' | sed 's/:/\//g')
  xdg-open $changeSshUrl
}

LIST_CMD+=('git delete remote => grm')
grm() {
  local getListRemote=$(git remote)
  local remoteName=$(echo $getListRemote | fzf)
  git remote rm $remoteName
}
