function addHistory() {
    if [ -n "$BASH_VERSION" ]; then
        history -s "$1"
    elif [ -n "$ZSH_VERSION" ]; then
        print -s "$1"
    else
        echo "Unsupported shell"
    fi
}