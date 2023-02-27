# func fuzzy 
FILEFUZZY(){
vim_w_fzf=$(FZF --preview)
while [ "$vim_w_fzf" != "" ]
do 
$1 $vim_w_fzf
break
done
}
# lvim
alias vf='FILEFUZZY nvim'
# nvim
alias nvf='FILEFUZZY nvim'
# nvim
alias lvf='FILEFUZZY nvim'
vfb (){
vim_w_fzf=$(find *.$1 -type f | fzf > selected)
while [ "$vim_w_fzf" != "" ]
do 
nvim $vim_w_fzf
break
done

}
alias cf='
cd_w_fzf=$(find * -type d | fzf)
while [ "$cd_w_fzf" != "" ]
do 
cd $cd_w_fzf
break
done
'
# fzf
alias wlf='
dwl
vf
'
alias wdf='
dwd
vf
'
alias wdof='
dwdo
vf
'

alias wpf='
dwp
vf
'
