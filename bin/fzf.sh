# func fuzzy 
FILEFUZZY(){
vim_w_fzf=$(FZF --preview)
while [ "$vim_w_fzf" != "" ]
do 
$1 $vim_w_fzf
break
done
}
LIST_CMD+=('fzf open with nvim => vf')
vf(){
  FILEFUZZY nvim
}
LIST_CMD+=('find dir by .ext => vfe')
vfe(){
vim_w_fzf=$(find *.$1 -type f | fzf > selected)
while [ "$vim_w_fzf" != "" ]
do 
nvim $vim_w_fzf
break
done
}
LIST_CMD+=('fzf cd folder => cf')
cf(){
  cd_w_fzf=$(find * -type d | fzf)
  while [ "$cd_w_fzf" != "" ]
  do 
  cd $cd_w_fzf
  break
  done
}
LIST_CMD+=('find project => cfp')
# split with ' => '
cfp(){
  # transform array to string
  LIST_PROJECT=$(printf '%s\n' "${LIST_PROJECT[@]}")
  local Dir="$(echo $(echo $LIST_PROJECT | fzf) | awk -F' => ' '{print $2}')"
  cd $Dir
}
LIST_CMD+=('fzf list git => cfg')
alias cfg='
cd $(find ~/. -type d -name .git -prune -exec dirname {} \; | fzf)
'
fcmd(){
  local LIST_CMD=$(printf '%s\n' "${LIST_CMD[@]}")
  local CMD="$(echo $(echo $LIST_CMD | fzf) | awk -F' => ' '{print $2}')"
  eval $CMD
}
