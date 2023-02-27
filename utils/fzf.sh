alias FZF="
    find . -type f -not -path '*/\.git/*' ! -path '*/\node_modules/*' | fzf --height 90% --layout reverse --info inline --border rounded \
    --preview 'bat --style=numbers --color=always --line-range :500 {}' \
    --color 'fg:#bbccdd,fg+:white,bg:#000526,preview-bg:#223344,border:#778899'
"
