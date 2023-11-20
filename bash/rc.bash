source $dc/bash/**/*.sh
source $dc/bash/theme.sh
for sumber_dir in $(find $dc/utils/*.sh $dc/alias); do
  source $sumber_dir
done
# zsh prompt
# source $MYZSHPLUG/prompt/main.zsh
# pnpm
export PNPM_HOME="$dr/.pnpm/"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac