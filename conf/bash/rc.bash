source $dc/conf/bash/**/*.sh
source $dc/conf/bash/theme.sh
for sumber_dir in $(find $dc -name '*.sh' -type f -not -path "*/conf/*"); do
  source $sumber_dir
done
