alias gbf='git branch --no-color | grep -vE "^\*|$(git rev-parse --abbrev-ref HEAD)" | fzf | xargs git checkout'
LIST_CMD+=('swich git branch => gbf')
# flow start
gfs(){
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  git branch --no-color | grep -vE "^\*|$(echo $current_branch)" | fzf | xargs git checkout
  local branch_change=$(git rev-parse --abbrev-ref HEAD)
  if (( "${branch_change}" != "${current_branch}" )); then
    eval git merge $current_branch $branch_change
  fi
}
LIST_CMD+=('flow start git => gfs')