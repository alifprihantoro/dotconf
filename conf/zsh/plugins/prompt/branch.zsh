# Git symbols
DISTROPROMPT_GIT_DIRTY="✖"
DISTROPROMPT_GIT_CLEAN=""
DISTROPROMPT_GIT_AHEAD=""
DISTROPROMPT_GIT_BEHIND=""

GIT_INFO() {
   # HEAD test and branch name
   local ref
   ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
   local ret=$?
   if [[ $ret != 0 ]]; then
      [[ $ret == 128 ]] && return
      ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
   fi
   # current branch
   local current_branch="${ref#refs/heads/}"
   echo -n "%F{25}%f%B%K{25}%F{6}"
   echo -n "  ${current_branch} "

   # Ahead, behind and dirtyness tests
   if [[ -n "$(command git rev-list origin/${current_branch}..HEAD 2> /dev/null)" ]]; then
      echo -n "%F{11}$DISTROPROMPT_GIT_AHEAD%f"
   elif [[ -n "$(command git rev-list HEAD..origin/${current_branch} 2> /dev/null)" ]]; then
      echo -n "%F{9}$DISTROPROMPT_GIT_BEHIND%f"
   else
      git diff-index --quiet HEAD -- 2>/dev/null
      if [[ $? -ne 0 ]] ; then
         echo -n "%F{9}$DISTROPROMPT_GIT_DIRTY%f"
      else
         if [[ "$DISTROPROMPT_SHOW_DIR" == "right" ]] ; then
            echo -n "%F{11}$DISTROPROMPT_GIT_CLEAN%f"
         fi 
      fi
   fi
   echo "%K%F{25}%f%k"
}
