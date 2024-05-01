# func fuzzy
FILEFUZZY(){
  vim_w_fzf=$(FZF --preview)
  while [ "$vim_w_fzf" != "" ] do
    $1 $vim_w_fzf
    break
  done
}