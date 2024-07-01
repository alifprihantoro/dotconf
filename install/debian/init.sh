read -p "Do you want to isntall full? (y/N): " INSTALL_FULL
read -p "Do you use termux proot? (y/N): " isTermuxProot
if [ "$isTermuxProot" == "y" ]; then
  read -p "your'e home dir ? (default : /data/data/com.termux/files/home/): " dr
  if [ "$dr" == "" ]; then
    dr=/data/data/com.termux/files/home/
  fi
else
  read -p "your'e home dir ? (default : $HOME): " dr
  if [ "$dr" == "" ]; then
    dr=$HOME
  fi
fi
read -p "your'e name folder config ? (default : .myconf): " dc
if [ "$dc" == "" ]; then
  dc=$dr/.myconf
else
  dc=$dr/$dc
fi

echo "Enter a number to select install: "
select OPTS_INSTALL in i3 openbox xfce; do
  source $dc/install/debian/${OPTS_INSTALL}.sh
  break
done
