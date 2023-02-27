## install 
### clone repo
```bash
git clone --depth=1 https://github.com/muryp/cli-config
```
### ssh
```bash
git remote add origin git@github.com:muryp/cli-config.git
```

### install power10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```
### install app on termux
```bash
apk update -y
apk upgrade -y
apk install bat nodejs neovim python gh git wget openssh zsh lsd fzf tmux ripgrep termux-api proot proot-distro
```

#### npm
```bash
npm i -g live-server yarn
```
#### ctags make
```bash
pkg install ctags
# kalo gak bisa pakek dibawah
pkg install make autoconf pkg-config automake jq
```

#### proot-distro
```bash
proot-distro install debian
proot-distro login debian
```

### linux
```bash
apt update -y
apt upgrade -y
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common xfe4-terminal openbox
```

#### nvm
```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

## config

### zshrc
```bash
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

dr=~/
dc=$dr.myconf
source $dc/conf/zsh/rc.zsh
# for termux
source $dc/conf/termux/alias.sh
```
### bashrc
```bash
dr=~/
dc=$dr.myconf
source $dc/conf/bash/rc.bash
# for termux
source $dc/conf/termux/alias.sh
```

### tmux
```bash
source ~/.myconf/conf/tmux/tmux.config
source ~/.myconf/conf/tmux/blue.tmuxtheme
```

### nvm
```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

### termux
- copy `conf/termux.properties` and paste into `~/.termux/termux.properties`
- copy `conf/colors.properties` and paste into `~/.termux/colors.properties`

### openbox
copy `conf/openbox` in ~/.config/

### debian
```bash
dr=/data/data/com.termux/files/home
dc=$dr/.myconf
source $dc/conf/bash/rc.bash
# for termux
source $dc/conf/termux/alias.sh
alias sta='
rm -r .vnc/:*
rm -r .vnc/loc*
rm -r /tmp/.*
vncserver -geometry 1561x720'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
