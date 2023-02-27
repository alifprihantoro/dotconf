# add ssh
alias gssh='
echo "add ssh"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github'
