findUp(){
  local x=`pwd`
  while [ "$x" != "/" ] ; do
      if [ -f "$x/$1" ]; then
        break
      fi
      if [ -d "$x/.git" ]; then
        x='404'
        break
      fi
      x=`dirname "$x"`
  done
  echo $x
}