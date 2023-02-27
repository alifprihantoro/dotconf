for sumber_dir in $(find $dc/**/*.sh -type f -not -path 'bash/*' ! -path "*/ubuntu*" ! -path "web*" ! -path "*/oh_my_bash/*" ! -path "*/conf/*"); do
  source $sumber_dir
done
# for change dir whitout cd
setopt auto_cd
# autocomplete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# vi key
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# prom shell
MYZSHPLUG=$dc/conf/zsh/plugins
# source $MYZSHPLUG/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# source $MYZSHPLUG/.p11k.zsh
source $MYZSHPLUG/zsh-vi-mode.plugin.zsh
source $MYZSHPLUG/autopair.zsh
source $MYZSHPLUG/syntax-hilight/fast-syntax-highlighting.plugin.zsh

# auto pair
AUTOPAIR_LBOUNDS=(all '[.:/\!]')
AUTOPAIR_LBOUNDS+=(quotes '[]})a-zA-Z0-9]')
AUTOPAIR_LBOUNDS+=(spaces '[^{([]')
AUTOPAIR_LBOUNDS+=(braces '')
AUTOPAIR_LBOUNDS+=('`' '`')
AUTOPAIR_LBOUNDS+=('"' '"')
AUTOPAIR_LBOUNDS+=("'" "'")

AUTOPAIR_RBOUNDS=(all '[[{(<,.:?/%$!a-zA-Z0-9]')
AUTOPAIR_RBOUNDS+=(quotes '[a-zA-Z0-9]')
AUTOPAIR_RBOUNDS+=(spaces '[^]})]')
AUTOPAIR_RBOUNDS+=(braces '')

# zsh autocomplete
source $MYZSHPLUG/zsh-autosuggestions.zsh

# zsh prompt
# source $MYZSHPLUG/prompt/main.zsh
