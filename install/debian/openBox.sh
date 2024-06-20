apt update -y
apt upgrade -y
apt install openbox -y
dr=/data/data/com.termux/files/home/
dc=$dr/.myconf
source $dc/install/debian/apps.sh
source $dc/install/debian/configs.sh

# setup themes
git clone https://github.com/addy-dclxvi/openbox-theme-collections --depth=1 ~/.themes
