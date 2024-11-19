#setup rc
cd
cat >~/.zshrc <<EOF
export dr=/data/data/com.termux/files/home
export dc=$dr/.myconf
source $dc/home/.zshrc
EOF
chmod +x ~/.zshrc
# setup configs
# WARNING: DELETE NOT USED CONFIG
mkdir .config
ln -s $dc/.config/* ~/.config
# setup rc
# WARNING: DELETE NOT USED CONFIG
ln -s $dc/home/.* ~/

# setup font
aria2c -x5 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv
