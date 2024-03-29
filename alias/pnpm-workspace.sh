cfw() {
  local ARG_FIND=pnpm-workspace.yaml
  local ROOT_DIR=$(findUp $ARG_FIND)
  local LIST_YML=$(echo $(yq "((.packages[]) |= \"$ROOT_DIR/\" + . +\"/\") | .packages[]" $ROOT_DIR/$ARG_FIND) | tr '\n' ' ')
  local DIR=$(eval ls -d $LIST_YML | fzf)
  if [ ! -z "$DIR" ]; then
    cd $DIR
  fi
}