apt update -y
apt upgrade -y
apt-get install openbox -y
# delete not used appj
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
git clone https://github.com/addy-dclxvi/openbox-theme-collections --depth=1 ~/.themes
