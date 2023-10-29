precmd() {
   local distroprompt_exit_color="%(?.${DISTROPROMPT_NOERROR_COLOR}.${DISTROPROMPT_ERROR_COLOR})"  

   # Update terminal title
   print -Pn "\e]0;%n@%m:%/\a"  

   # Directory name placement
   if [[ "$DISTROPROMPT_SHOW_DIR" == "left" ]] ; then
      local dir_left="$(distroprompt_dir)"
   elif [[ "$DISTROPROMPT_SHOW_DIR" == "right" ]] ; then
      local dir_right="$(distroprompt_dir)"
   fi

   # Main prompt (PS1)
   PROMPT="${DISTROPROMPT_LEFT_PROMPT_COLOR}${dir_left}$(distroprompt_os_symbol)${distroprompt_exit_color}$(distroprompt_status_symbol) %b%f"

   # Right prompt
   RPROMPT="${DISTROPROMPT_RIGHT_PROMPT_COLOR}${dir_right}$(distroprompt_git_info)%b%f"
}
