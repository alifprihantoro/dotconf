alias open='termux-open '
alias openb='termux-open-url '
alias pbcopy='termux-clipboard-set'
alias pbpaste='$(termux-clipboard-get)'

catc () {
  cat $1 > $2
}
catp () {
  cat $1 >> $2
}
alias u='proot-distro login debian'

alias postgres_setup='
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql
'
alias postgres_run='
pg_ctl -D $PREFIX/var/lib/postgresql start
'
alias postgres_stop='
pg_ctl -D $PREFIX/var/lib/postgresql stop
'