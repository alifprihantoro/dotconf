# push all branch and remote
function gsp(){
  MYGSV
  gssh
  git remote | xargs -L1 git push --all
  cd $DIRNOW
}
