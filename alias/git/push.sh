LIST_CMD+=('git push => gp')
gp() {
  local getCurrentBranch=$(git rev-parse --abbrev-ref HEAD)
  local getListRemote=$(git remote)
  local remoteName=$(echo $getListRemote | fzf)
  git push $remoteName $getCurrentBranch
}
LIST_CMD+=('git push all branch and remote => gpabr')
function gpabr() {
  gssh
  git remote | xargs -L1 git push --all
}
LIST_CMD+=('git commit then push all branch and remote => gcpabr')
function gcpabr() {
  MYGSV
  gpab
  cd $DIRNOW
}
