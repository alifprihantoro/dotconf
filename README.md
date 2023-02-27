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
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common xfe4-terminal
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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
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
- paste in `~/.termux/termux.properties`
```bash
### Uncomment to let Termux start in full screen mode.
fullscreen = true

### Cursor blink rate. Values 0, 100 - 2000.
terminal-cursor-blink-rate = 500

# Open a new terminal with ctrl + 3 (volume down + t)
shortcut.create-session = ctrl + 3

# Go one session down with (for example) ctrl + 3
shortcut.next-session = ctrl + 2

# Go one session up with (for example) ctrl + 1
shortcut.previous-session = ctrl + 1

# delete this if <C-Space> already works
ctrl-space-workaround = true
### Two rows with more keys
extra-keys = [[\
{macro: "CTRL a CTRL k", display: ↑}, \
{macro: "CTRL a CTRL j", display: ↓}, \
{macro: "CTRL a c", display: +}, \
{macro: "CTRL a :", display: cmd}, \
'DEL',\
'KEYBOARD',\
'DRAWER'\
]]
### Force black colors for drawer and dialogs
# use-black-ui = true
allow-external-apps = true
```
- paste in `~/.termux/colors.properties`
```bash
# https://github.com/chriskempson/base16-xresources/blob/master/base16-twilight.dark.256.xresources
# Base16 Twilight
# Scheme: David Hart (http://hart-dev.com)
foreground=#a7a7a7
background=#161617
cursor=#a7a7a7

color0=#1e1e1e
color1=#cf6a4c
color2=#8f9d6a
color3=#f9ee98
color4=#7587a6
color5=#9b859d
color6=#afc4db
color7=#a7a7a7
color8=#5f5a60
color9=#cf6a4c
color10=#8f9d6a
color11=#f9ee98
color12=#7587a6
color13=#9b859d
color14=#afc4db
color15=#ffffff

color16=#cda869
color17=#9b703f
color18=#323537
color19=#464b50
color20=#838184
color21=#c3c3c3
```
