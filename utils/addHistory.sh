function addHistory() {
    if [ -n "$BASH_VERSION" ]; then
        history -s "$@"
    elif [ -n "$ZSH_VERSION" ]; then
        print -s "$@"
    else
        echo "Unsupported shell"
    fi
}