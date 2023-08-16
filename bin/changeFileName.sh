LIST_CMD+=('change file by ext => vf')
function changeFileName(){
  read "EXT_BEFORE? Extention want to change : "
  read "EXT_AFTER? Extention want to change : "
  for f in $(find *.$EXT_BEFORE); do 
    mv $f $(echo $f | sed -e 's/\.wiki//g').$EXT_AFTER
  done
}
