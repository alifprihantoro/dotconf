alias gre='git rebase'
alias gref="git rebase -i \$(git log --pretty=oneline | fzf +m | awk '{print \$1}')^"
alias grec="git rebase --continue"
LIST_CMD+=('git rebase => gre')
LIST_CMD+=('git rebase wiht fzf => gref')
LIST_CMD+=('git rebase continue => grec')
