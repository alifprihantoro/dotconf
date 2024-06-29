LIST_CMD+=('fzf list cmd execute pnpm/npm/yarn => nfe')
# TODO: get lock file, if use pnpm or npm or yarn
nfe() {
  local ARG_FIND=package.json
  local ROOT_DIR=$(findUp $ARG_FIND true)
  local CMD=$(echo "$(yq '.scripts | keys | .[]' $ROOT_DIR/$ARG_FIND -o=y)" | fzf)
  if [ ! -z "$CMD" ]; then
    local CMD="pnpm $CMD"
    addHistory $CMD
    eval $CMD
  fi
}
