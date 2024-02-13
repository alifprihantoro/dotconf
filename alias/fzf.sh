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
  local list_dir=$(find . -maxdepth 1 -type d -name "*" -print)
  local cd_w_fzf=$(echo -e "$list_dir\n.." | fzf)
  if [ ! -z "$cd_w_fzf" ]; then
    if [ "$cd_w_fzf" = "." ]; then
      echo "you're in $(pwd)"
    else
      cd $cd_w_fzf
      cf
    fi
  fi
}
LIST_CMD+=('find project => cfp')
# split with ' => '
cfp(){
  # transform array to string
  LIST_PROJECT=$(printf '%s\n' "${LIST_PROJECT[@]}")
  local DIR=$(echo "$LIST_PROJECT" | fzf | awk -F' => ' '{print $2}')
  if [ ! -z "$DIR" ]; then
    local CMD="cd $DIR"
    addHistory $CMD
    eval $CMD
  fi
}
LIST_CMD+=('fzf list git => cfg')
alias cfg='
cd $(find ~/. -type d -name .git -prune -exec dirname {} \; | fzf)
'
fcmd(){
  local LIST_CMD=$(printf '%s\n' "${LIST_CMD[@]}")
  echo $LIST_CMD | fzf
}

LIST_CMD+=('fzf list repo => ghc <username>')
ghc(){
  git clone https://github.com/$(gh repo list $1 | fzf | awk '{print $1}')
}

LIST_CMD+=('fzf list command pnpm/npm/yarn => pnf')
pnf(){
  local ARG_FIND=package.json
  local ROOT_DIR=$(findUp $ARG_FIND)
  local CMD=$(echo "$(yq '.scripts | keys | .[]' $ROOT_DIR/$ARG_FIND -o=y)" | fzf)
  if [ ! -z "$CMD" ]; then
    local CMD="pnpm $CMD"
    addHistory $CMD
    eval $CMD
  fi
}

LIST_CMD+=('fzf list history => fh')
fh(){
  local USER_OPTION=$(echo "$(history)" | fzf --tac | sed -e 's/^[[:space:]]*[0-9]\+[[:space:]]*//')
  if [ ! -z "$USER_OPTION" ]; then
    eval $USER_OPTION
  fi
}

LIST_CMD+=('fzf list help => fhe')
fhe(){
  local LIST_HELP=$(man -k . | cut -d '(' -f1 | fzf -m --preview 'man {1}')
  nvim -c ":Man $(LIST_HELP)" -c ":only"
}