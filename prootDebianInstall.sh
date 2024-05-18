apt update -y
apt upgrade -y
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common xfce4-terminal openbox jgmenu

# setup configs
mkdir .config
cd .config
ln -s /data/data/com.termux/files/home/.myconf/openbox/
ln -s /data/data/com.termux/files/home/.myconf/xfce4/
ln -s /data/data/com.termux/files/home/.config/nvim/

# setup font
cd
aria2 https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode .fonts/firacode
fc-cache -fv

# setup themes
git clone https://github.com/addy-dclxvi/openbox-theme-collections --depth=1 ~/.themes
