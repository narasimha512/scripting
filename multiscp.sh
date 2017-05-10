for dest in $(<$1.lst); do
  scp $2 ${dest}:/home/rtp99
done
