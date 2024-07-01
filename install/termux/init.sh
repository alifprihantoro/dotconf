read -p "is use pacman ? (Y/n): " isUsePacman
rm ~/../usr/etc/motd
source $dc/install/termux/app.sh
source $dc/install/apps.sh
echo "tmux" >~/../usr/etc/termux-login.sh

# setup starter
GET_PROFILE=$(cat ~/../usr/etc/profile)
cat >~/../usr/etc/profile <<EOF
dr=\$HOME/
dc=\$dr.myconf
source \$dc/termuxAlias.sh
$GET_PROFILE
EOF

local dc=~/.myconf
rt=$dc/tmux/
#add starter
ln -s $dc/home/.* ./ # link rc
chsh -s zsh          # set default to zsh
rm -rf .termux
mv termux .termux
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
tic -x $rt/xterm-256color-italic.terminfo
tic -x $rt/tmux-256color.terminfo
