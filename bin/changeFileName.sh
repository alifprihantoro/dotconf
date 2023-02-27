function changeFile(){
  for f in $(find ~/.myconf/**/*.wiki); do 
    mv $f $(echo $f | sed -e 's/\.wiki//g').md
  done
}
