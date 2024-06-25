pkg update -y
pkg upgrade -y
# install cli tools
pkg install bat gh git zsh lsd fzf tmux ripgrep termux-api yq which make man aria2 htop -y
# security apps
pkg openssh
go install github.com/google/osv-scanner/cmd/osv-scanner@main # use main because latest ver. have bug for pnpm
# add glibc
pacman -S glibc-runner
# setup gh cli
gh config set editor vim
# install db
pkg install postgresql mariadb -y
# install language and related tools
pkg install nodejs eslint golang rust php composer python python-pip -y
npm i -g pnpm         # install pnpm
pnpm i -g live-server # tools live server

# install wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar ~/../usr/bin/wp
# install bun
# aria2c -x5 https://github.com/oven-sh/bun/releases/latest/download/bun-linux-aarch64.zip bun.zip
# unzip bun.zip
# mkdir -p ~/.bun/bin
# mv bun/bun ~/.bun/bin
# rm -rf bun
# echo '#!/bin/sh\ngrun ~/.bun/bun $@' >~/../usr/bin/bun
# chmod +x ~/../usr/bin/bun
