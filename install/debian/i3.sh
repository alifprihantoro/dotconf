apt update -y
apt upgrade -y
apt install i3 -y
# delete not used appj
apt remove xfce4-terminal -y
apt autoremove
apt autoclean

# WARNING: change this to root directory
dr=/data/data/com.termux/files/home/
dc=$dr/.myconf
ln -sf $dc/bin/* /bin/
source $dc/install/debian/apps.sh
source $dc/install/debian/configs.sh

# setup themes
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git --depth=1 ~/.config/i3
ln -s $HOME/.config/i3/my-theme.json $HOME/.config/i3/bumblebee-status/themes/
