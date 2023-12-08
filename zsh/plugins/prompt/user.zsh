user_symbol() {
   # Root
   if [[ $EUID == 0 ]] ; then
      echo -n "%B%F{228}"
   else
      stat_ret=( $(stat -Lc "%a %G %U" "`pwd`") )
      local stat_perm=${stat_ret[1]}
      local stat_owner=${stat_ret[3]}
   fi

}
local user_symbol=('%B%K{32}%F{6}$(user_symbol)%f%k%b')
