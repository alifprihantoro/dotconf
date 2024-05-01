LIST_CMD+=('fzf list repo => ghc <username>')
ghc(){
  git clone https://github.com/$(gh repo list $1 | fzf | awk '{print $1}')
}