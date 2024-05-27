LIST_CMD+=('gh issue edit => ghie')
function ghie() {
  LISTGITHUBISSUE=
  LISTGITHUBISSUE=$(gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}')
  gh issue edit $LISTGITHUBISSUE
}
LIST_CMD+=('gh issue browse => ghib')
function ghib() {
  gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}' | xargs gh issue view --web
}
LIST_CMD+=('gh issue view => ghiv')
function ghiv() {
  LISTGITHUBISSUE=$(gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}')
  gh issue view $LISTGITHUBISSUE --comments
}
LIST_CMD+=('gh issue view => ghiv')
function ghia() {
  gh issue create
}
