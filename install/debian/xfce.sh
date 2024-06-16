apt update -y
apt upgrade -y
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common xfce4-terminal xfce4 dbus-x11 jgmenu
# install
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman
dr=/data/data/com.termux/files/home/
dc=$dr/.myconf
cd /usr/share/applications/
ln -s $dc/desktop/* ./

# setup configs
mkdir .config
cd .config
ln -s $dc/.config/* ./

# setup rc
cd
ln -s $dc/home/.* ./

# setup font
cd
aria2 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv

# setup themes
