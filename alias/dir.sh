alias cdg='prev_dir=$(pwd)
cd $(git rev-parse --show-toplevel)'
zzz=$dr/zzz
# db=$dc/bash
dssh=$dr.ssh
dp=$dr/project
dw=$dp/web
dm=$dw/muryp
dvp=$dr/.local/share/nvim/site/pack/packer/
dv=$dr/.config/nvim

alias dr='cd $dr'
alias zzz='cd $zzz'
alias dc='cd $dc'
alias db='cd $db'
alias dv='cd $dv'
alias dssh='cd $dssh'
alias dp='cd $dp'
alias dw='cd $dw'
alias dm='cd $dm'
alias dvc='cd $dvc'
alias dvp='cd $dvp'
LIST_PROJECT=(
  "Muryp => $dm"
  "public project => $dp/public"
  "nvim git => $dp/public/nvim-muryp-git"
  "router dom => $dp/public/router-dom"
  "notes => $dp/notes"
  "nvim md => $dp/public/nvim-muryp-md"
  "daily project => $dp/daily"
  "lazy nvim => $dv/lazy"
  "alifprihantoro => $dw/alifprihantoro"
  "lab => $dp/lab"
  "learn => $dp/learn"
  "content => $dw/alifprihantoro/contents"
)
