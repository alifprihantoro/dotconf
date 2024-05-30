# git commit
alias gcm='git commit -am'
function MYGSV() {
  DIRNOW=$(pwd)
  cdg
  ga .
  git commit
}
