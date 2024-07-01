LIST_CMD+=('fzf list workspace npm => nfw')
goToWorkspaceNpm() {
  local FILE_NAME=$1
  local ROOT_DIR=$2
  local OBJ=$3
  local GET_JSON=$(eval $(echo "yq \"((.${OBJ}[]) |= \\\"$ROOT_DIR/\\\" + . +\\\"/\\\") | .${OBJ}[]\" $ROOT_DIR/$FILE_NAME -o yaml"))
  local LIST_YML=$(echo $GET_JSON | tr '\n' ' ')
  local WORKSPACE_LIST=$(eval ls -d "$LIST_YML" | sed "s|$ROOT_DIR||")
  local USER_SELECT=$(echo $WORKSPACE_LIST | tr '  ' '\n' | tr ' ' '\n' | fzf)
  if [ ! -z "$USER_SELECT" ]; then
    cd $ROOT_DIR/$USER_SELECT
  fi
}
nfw() {
  local FILE_NAME_PNPM=pnpm-workspace.yaml
  local ROOT_DIR_PNPM=$(findUp $FILE_NAME_PNPM)
  if [ "$ROOT_DIR_PNPM" = "404" ]; then
    local FILE_NAME_NPM=package.json
    local ROOT_DIR_NPM=$(findUp $FILE_NAME_NPM)
    if [ "$ROOT_DIR_NPM" != "404" ]; then
      goToWorkspaceNpm $FILE_NAME_NPM $ROOT_DIR_NPM 'workspaces'
    fi
  else
    goToWorkspaceNpm $FILE_NAME_PNPM $ROOT_DIR_PNPM 'packages'
  fi
}

# TODO: get lock file, if use pnpm or npm or yarn
# TODO: change root dir from `.git` to `lock file`
