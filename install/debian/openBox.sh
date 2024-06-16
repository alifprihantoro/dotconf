apt update -y
apt upgrade -y
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common openbox jgmenu thunar lxappearance kitty -y
# install
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman
dr=/data/data/com.termux/files/home/
dc=$dr/.myconf
cd /usr/share/applications/
ln -s $dc/desktop/* ./

#setup rc
cat >~/.zshrc <<EOF
export dr=/data/data/com.termux/files/home
export dc=\$dr/.myconf

alias sta='
rm -r .vnc/:*
rm -r .vnc/loc*
rm -r /tmp/.*
vncserver -geometry 520x260'
alias sto='
vncserver -kill :1
'
stoo() {
  vncserver -kill :$1
}
source \$dc/home/zshrc
EOF
# setup chrome for default using no sandbox
local CHROME_BIN=$(cat /bin/chromium)
local CHROME_DELETE_FIRST_LINE=$(echo $CHROME_BIN | sed '1d')
local RESULT_CHROME=$(echo "
#!/bin/bash
main(){
  $CHROME_DELETE_FIRST_LINE
}
local checkIsRoot=\$(id -u)
if [[ \$checkIsRoot -ne 0 ]]; then
  main
else
  main --no-sandbox
fi
")
echo $RESULT_CHROME >/bin/chromium
# install postman
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman
dr=/data/data/com.termux/files/home/
dc=$dr/.myconf
ln -s $dc/desktop/* /usr/share/applications
# setup configs
# WARNING: DELETE NOT USED CONFIG
mkdir .config
ln -s $dc/.config/* ~/.config
# setup rc
# WARNING: DELETE NOT USED CONFIG
ln -s $dc/home/.* ~/

# setup font
cd
aria2c -x5 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv

# setup themes
git clone https://github.com/addy-dclxvi/openbox-theme-collections --depth=1 ~/.themes
