apt update -y
apt upgrade -y
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common kitty i3 lxappearance thunar -y
# delete not used appj
apt remove xfce4-terminal -y
apt autoremove
apt autoclean
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

# setup i3
cat >/bin/i3Next <<EOF
#!/bin/bash
main() {
  local CURRENT_WORKSPACE=\$(cat ~/.i3_current_workspace)
  local NEXT_WORKSPACE=\$((1 + \$CURRENT_WORKSPACE))
  if [[ \$CURRENT_WORKSPACE -lt 8 ]]; then
    i3 workspace number \$NEXT_WORKSPACE
    echo \$NEXT_WORKSPACE >~/.i3_current_workspace
  fi
}
main
EOF
cat >/bin/i3MoveNext <<EOF
#!/bin/bash
main() {
  local CURRENT_WORKSPACE=\$(cat ~/.i3_current_workspace)
  local NEXT_WORKSPACE=\$((1 + \$CURRENT_WORKSPACE))
  i3 move container to workspace number \$NEXT_WORKSPACE
  echo \$NEXT_WORKSPACE >~/.i3_current_workspace
}
main
EOF
cat >/bin/i3Prev <<EOF
#!/bin/bash
main() {
  local CURRENT_WORKSPACE=\$(cat ~/.i3_current_workspace)
  local NEXT_WORKSPACE=\$((\$CURRENT_WORKSPACE - 1))
  if [[ \$CURRENT_WORKSPACE -gt 1 ]]; then
    i3 workspace number \$NEXT_WORKSPACE
    echo \$NEXT_WORKSPACE >~/.i3_current_workspace
  fi
}
main
EOF
cat >/bin/i3MovePrev <<EOF
#!/bin/bash
main() {
  local CURRENT_WORKSPACE=\$(cat ~/.i3_current_workspace)
  local NEXT_WORKSPACE=\$((\$CURRENT_WORKSPACE - 1))
  i3 move container to workspace number \$NEXT_WORKSPACE
  echo \$NEXT_WORKSPACE >~/.i3_current_workspace
}
main
EOF

cat >/bin/i3GoTo <<EOF
#!/bin/bash
i3 workspace number \$1
echo \$1
echo \$1 >~/.i3_current_workspace
EOF
cat >/bin/i3MoveTo <<EOF
#!/bin/bash
i3 workspace number \$1
echo \$1 > ~/.i3_current_workspace
EOF

chmod +x /bin/i3*

# setup font
cd
aria2c -x5 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv

# setup themes
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git --depth=1 ~/.config/i3
