randomNum=$((1 + $RANDOM % 2))
if [ $randomNum -eq 1 ]; then
  figlet -f Bloody Evangelospro|lolcat
elif [ $randomNum -eq 2 ]; then
  neofetch
fi