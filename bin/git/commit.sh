function gsv(){
MYGSV
cd $DIRNOW
}
# amend (change last commit)
alias gsvm='
MYGSV
read -p "Your Message : " msg
git commit --amend "$msg"
break
done'
