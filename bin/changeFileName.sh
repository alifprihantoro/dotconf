function changeFileName(){
  for f in $(find *.$1); do 
    mv $f $(echo $f | sed -e 's/\.wiki//g').$1
  done
}
