apt update -y
apt upgrade -y
apt install wget chromium firefox-esr tigervnc-standalone-server tigervnc-common kitty lxappearance thunar -y
# install
aria2c -x5 https://dl.pstmn.io/download/latest/linux_arm64 --out=postman.tar.gz
tar -xvzf postman.tar.gz
mv Postman .postman
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
