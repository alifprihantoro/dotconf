apt update -y
apt upgrade -y
apt install i3 -y
# use pip/python if not in apt
apt install python3-i3ipc
# delete not used appj
apt remove xfce4-terminal -y
apt autoremove
apt autoclean
ln -sf $dc/bin/* /bin/
if [ "$INSTALL_FULL" == "y" ]; then
  source $dc/install/debian/installFull.sh
else
  source $dc/install/debian/installMin.sh
fi
source $dc/install/debian/configs.sh

# setup themes
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git --depth=1 ~/.config/i3
ln -s $HOME/.config/i3/my-theme.json $HOME/.config/i3/bumblebee-status/themes/
