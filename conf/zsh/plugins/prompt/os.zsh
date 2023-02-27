# function cek os
os_symbol() {
     # OS test
        if [ "Gentoo" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Arch" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Debian" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Slackware" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Ubuntu" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Mint" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "suse" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "RHEL" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Fedora" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "CentOS" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Elementary" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "NixOS" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Manjaro" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Alpine" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Devuan" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Mageia" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Sabayon" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "Raspbian" == "$(uname -o)" ]
        then
           echo -n ""
        elif [ "FreeBSD" == "$(uname -o)" ]
        then
        echo -n ""
        elif [ "Darwin" == "$(uname -o)" ]
        then
        echo -n "" 
        elif [ "WindowsNT" == "$(uname -o)" ]
        then
        echo -n ""
        elif [ "Android" == "$(uname -o)" ]
        then
        echo -n "" # 
        else
           # Distro cant be determined
           echo -n "" 
        fi
 }

os_symbol='%B%K{32}%F{6} $(os_symbol) %k%b'
