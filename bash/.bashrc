dr=/data/data/com.termux/files/home
dc=$dr/.myconf
source $dc/bash/rc.bash
alias sta='
rm -r .vnc/:*
rm -r .vnc/loc*
rm -r /tmp/.*
vncserver -geometry 1561x720'
alias sto='
vncserver -kill :1
'
stoo() {
  vncserver -kill :$1
}
# nvm dir
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# postman
alias postman='/root/.postman/app/Postman'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
