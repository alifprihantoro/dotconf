function gp(){
  gssh
  git remote | xargs -L1 git push --all
}
# push all branch and remote
function gsp(){
  MYGSV
  gp
  cd $DIRNOW
}
