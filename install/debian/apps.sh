apt-get update -y
apt-get upgrade -y
apt-get install wget chromium firefox-esr tigervnc-standalone-server tigervnc-common kitty lxappearance thunar -y
# install
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman
setup chrome for default using no sandbox
mv /bin/chromium /bin/chromium_real
touch /bin/chromium
chmod +x /bin/chromium
cat >/bin/chromium <<EOF
#!/bin/bash
if [[ \$(id -u) -ne 0 ]]; then
  /bin/chromium_real $@
else
  /bin/chromium_real --no-sandbox $@
fi
EOF
# install postman
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman

# add vscdoeium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg |
  gpg --dearmor |
  dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' |
  tee /etc/apt/sources.list.d/vscodium.list
apt update && apt install codium

# TODO: install libreoffice, ink, gimp, mongo compas

# add/rewrite desktop info
ln -sf $dc/desktop/* /usr/share/applications/

# rofi dmenu
apt-get install rofi -y
git clone --depth=1 https://github.com/adi1090x/rofi.git
