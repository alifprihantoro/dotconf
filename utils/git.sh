# git commit
alias gcm='git commit -am'
function MYGSV(){
  DIRNOW=$(pwd)
  cdg
  ga .
  statusCommit=$(git status -s)
  while [ "$statusCommit" != "" ]
  do 
    echo "kamu melakukan commit pada : \\n $statusCommit"
    echo "Your Message : $1" 
    gcm "$1"

    break
  done
}
