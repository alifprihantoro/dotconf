setopt prompt_subst
. $dc/.option/zsh/prompt/bassic.zsh
. $dc/.option/zsh/prompt/branch.zsh
. $dc/.option/zsh/prompt/cek_user.zsh
CEK_USER='%B%K{25}%F{6} $(CEK_USER) %k%b'
GIT_PROMT='$(GIT_INFO)%k%b'

PROMPT="${CEK_USER}%B%K{32}%F{25}%b%k%f${FILE}${SEGMENT_SEPARATOR}${NEWLINE}└❯ "

local _lineup=$'\e[1A'
local _linedown=$'\e[1B'
RPROMPT=%{${_lineup}%}${GIT_PROMT}%{${_linedown}%}
