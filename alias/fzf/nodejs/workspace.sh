LIST_CMD+=('fzf list command pnpm/npm/yarn => fp')
# TODO: get lock file, if use pnpm or npm or yarn
# TODO: change root dir from `.git` to `lock file`
nfw() {
  local ARG_FIND=pnpm-workspace.yaml
  local ROOT_DIR=$(findUp $ARG_FIND)
  local LIST_YML=$(echo $(yq "((.packages[]) |= \"$ROOT_DIR/\" + . +\"/\") | .packages[]" $ROOT_DIR/$ARG_FIND) | tr '\n' ' ')
  local LIST_DIR=$(eval ls -d $LIST_YML)
  local DIR_FZF=$(echo ${LIST_DIR//$ROOT_DIR/} | tr ' ' '\n' | fzf)
  if [ ! -z "$DIR_FZF" ]; then
    local DIR="$ROOT_DIR$DIR_FZF"
    cd $DIR
  fi
}