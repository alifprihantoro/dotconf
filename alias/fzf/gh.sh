LIST_CMD+=('fzf list repo => ghc <username>')
ghc() {
  local getRepo=$(gh repo list $1 | fzf | awk '{print $1}')
  if [ ! -z "$getRepo" ]; then
    read -p "is use depth 1? (Y/N): " answer
    local depth=''
    if [[ "$answer" =~ ^[Yy]$ ]]; then
      depth="depth=1"
    fi
    git clone https://github.com/$getRepo $depth
  fi
}
