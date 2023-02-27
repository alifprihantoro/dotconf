alias open='termux-open '
alias openb='termux-open-url '
alias pbcopy='termux-clipboard-set'
alias pbpaste='$(termux-clipboard-get)'

catc () {
  cat $1 > $2
}
catp () {
  cat $1 >> $2
}
alias u='proot-distro login ubuntu --termux-home --shared-tmp -- zsh'
