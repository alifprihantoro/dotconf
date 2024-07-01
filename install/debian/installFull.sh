source $dc/install/debian/apps.sh
# install cli tools
# TODO: man, which not isntalled yet
apt-get install bat gh git zsh lsd fzf tmux ripgrep yq make aria2 htop -y
# security apps
pkg install openssh-server openssh-client
# install db
apt-get install postgresql mariadb-server -y
# install language and related tools
apt-get install nodejs eslint golang rustc php composer python3 -y
source $dc/install/apps.sh
