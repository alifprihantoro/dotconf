LIST_CMD+=('fzf list command pnpm/npm/yarn => fp')
# TODO: get lock file, if use pnpm or npm or yarn
np(){
  local ARG_FIND=package.json
  local ROOT_DIR=$(findUp $ARG_FIND)
  local CMD=$(echo "$(yq '.scripts | keys | .[]' $ROOT_DIR/$ARG_FIND -o=y)" | fzf)
  if [ ! -z "$CMD" ]; then
    local CMD="pnpm $CMD"
    addHistory $CMD
    eval $CMD
  fi
}