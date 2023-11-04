source $dc/conf/bash/**/*.sh
source $dc/conf/bash/theme.sh
for sumber_dir in $(find $dc/utils/**/*.sh $dc/alias/**/*.sh); do
  source $sumber_dir
done