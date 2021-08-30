<<Documentation
NAME         : S.Jagajeevan
DATE         : 10.5.2021
DESCRIPTION  : Write a script to print a given number in reverse order 
INPUT        : ./06_reverse.sh 12345 (command line argumrnt)
OUTPUT       : 54321
Documentation

#!/bin/bash
# Write a script to print a given number in reverse order

num=$@								# command line argument is stored to variable for usage

len=${#num}							#  length of the argument is stored in variable 

rev=0
var='^[+-]?[0-9]?+[.]?[0-9]+$'

if ! [[ $num =~ $var ]]						# if the input is not a number this condition executes and exit 
then
   echo "Enter only numbers" 
   exit

elif [ $num -lt 10 ]						# if the input is a single digit number this condition executes
then
   echo "Pass a multi-digit number " 
   exit

elif [ $len -eq 0 ]						# if no arguments is passed this conditipon executes
then
   echo "No arguments passed"
  exit 

fi

while [ $num -ne 0 ]						# untill the number value not equals to zero the loop executes
do
	rem=`expr $num % 10`					# to find remainder
	rev=`expr $rev  \* 10`					# assigned rev value is multiplied by 10
	rev=$(($rev+$rem))					# reverse value and remainder is added and stored into reverse value
	num=`expr $num / 10`					# number value is changed for looping process
done

echo "Reversed number - $rev"

