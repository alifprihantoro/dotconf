function ghie(){
    LISTGITHUBISSUE= 
    LISTGITHUBISSUE=$(gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}')
    gh issue edit $LISTGITHUBISSUE
  }
function ghib(){
  gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}' | xargs gh issue view --web
}
function ghiv(){
  LISTGITHUBISSUE= 
  LISTGITHUBISSUE=$(gh issue list | fzf --preview "gh issue view {+1}" | awk '{print $1}')
  gh issue view $LISTGITHUBISSUE --comments
}
function ghia(){
  gh issue create
}
