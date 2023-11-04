function gsv(){
  MYGSV
  cd $DIRNOW
}
alias gca='git commit --amend'
LIST_CMD+=('git commit and add all => gsv')
LIST_CMD+=('git commit amend (change last commit) => gca')
