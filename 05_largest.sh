<<Documentation
NAME         : S.Jagajeevan
DATE         : 09.04.2021
DESCRIPTION  : compare the larger integer values from a n number of arguments
INPUT        : ./05_largest.sh 5 6 8 4 2 1 (command line argument)
OUTPUT       : Largest value is 8
Documentation

#!/bin/bash
# compare the larger integer values from a n number of arguments

if [ $# -eq 0 ] 	 # condition for checking either the arguments is passed or not
then
    echo " No arguments passed "
    exit
fi

lar=$1			 #assume large is 1st argument value
for i in $@
do
    if [ $lar -lt $i ]   #condition for chrcking the large number.. and the large number is lessthan to next number 
    then
	lar=$i		 # large value is changed
    fi
done
echo " Largest value is  $lar"
