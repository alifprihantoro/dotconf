## ======= bassic
alias mkdir='/bin/mkdir -p'
alias rm='/bin/rm -rf'
alias aliashelp='cat $default_bash_dir/alias/help.txt'
alias hssh='cat $db/help/SSH.md'
alias htmux='cat $db/help/tmux.md'
alias htar='cat $db/help/tar.md'
alias hhugo='cat $db/help/hugo.md'
alias ls='lsd'
alias l='lsd'
alias la='lsd -a'
alias lal='lsd -al'
alias ll='lsd -l'
alias rm='rm -rf'
alias cp='cp -rf'
alias cc='source ~/../usr/etc/profile && source ~/.zshrc && clear'
alias tc='touch'
alias q='exit -y'
alias cdr='cd -'
alias wget='wget -c'                # Preferred 'wget' implementation (resume download)
alias path='echo -e ${PATH//:/\\n}' # path:         Echo all executable Paths
LIST_CMD+=('link folder => ln -s')
LIST_CMD+=('help docs command => man')
LIST_CMD+=('monitoring => top,htop,gtop')
