# add ssh
function gssh(){
  echo "add ssh"
  eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github &&
}