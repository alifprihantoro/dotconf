apt update -y
apt upgrade -y
apt install chromium firefox-esr tigervnc-standalone-server tigervnc-common xfce4-terminal xfce4 dbus-x11 jgmenu
if [ "$INSTALL_FULL" == "y" ]; then
  source $dc/install/debian/installFull.sh
else
  source $dc/install/debian/installMin.sh
fi
source $dc/install/debian/configs.sh
