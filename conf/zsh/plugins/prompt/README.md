## how to setting
on `./main.zsh` :
- `PROMPT` : edit promt kiri
- `RPROMPT` : edit promp kanan
- `local _lineup=$'\e[1A'` : agar tidak kena new line <pembuka>
- `local _linedown=$'\e[1B'` : agar tidak kena new line <penutup>
- `%K{1}isi%k` : background color
- `%F{1}isi%F` : color font
- `%Bisi%b` : font bold
- `$(name_func)` : execute function
- `setopt prompt_subst` : agar function diperbarui ketika user execute command line
- `echo -n "foo"` : agar tidak ada new line ketika echo dibawahnya
- icon bisa dicari di `powerlevel10k/p10k` atau copy di google

## note
mungkin berguna
```zsh
. $dc/.option/zsh/prompt/os.zsh
. $dc/.option/zsh/prompt/user.zsh
. $dc/.option/zsh/prompt/git.zsh
local GIT_PROMT=('%B%K{32}%F{6}$(gitprompt)%f%k%b')
setopt PROMPT_SUBST
trap $(($iniVar+1)) DEBUG
    && PROMPT='%B%40<..<%~ %b$(gitprompt)' \
    && PROMPT+='%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{blue}❯%F{cyan}❯%F{green})❯.%F{red}❯❯❯)%f '
RPROMPT="${RIGHT_SEPARATOR}${CMD}${RIGHT_SUBSEG}${TIME}"
RPROMPT="${RIGHT_SEPARATOR}${CMD}${GIT_PROMT}${RIGHT_SUBSEG}${os_symbol}"
```

```zsh
# get untract
git ls-files --others --exclude-standard
# get modify
git ls-files -m
# show short status
git status -s
```
