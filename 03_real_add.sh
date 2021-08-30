<<Documentation
NAME         : S.Jagajeevan
DATE         : 09.05.2021
DESCRIPTION  : Write a script for addition of two numbers for real numbers also
INPUT        : ./03_real_add.sh
	       Enter the numbers to addition
	       10   20		
OUTPUT       : Answer is 30
Documentation

#!/bin/bash
# Write a script for addition of two numbers for real numbers also

echo  "Enter the numbers to addition "
read num1 num2								# read 2 inputs from user
sum=0		
var='^[+-]?[0-9]?+[.]?[0-9]+$'						# for checking whether the number is real number or not this command is stored in variable var

if [[ $num1 =~ $var ]]							# checking num1 is real number or not
then
    if [[ $num2 =~ $var ]]						# checking num2 is real number or not
    then
	echo -n "Answer is "
	echo "scale=2;$num1 + $num2" | bc				# adding 2 numbers and if it real number scale=2 (i.e, 2 digits after point)and piping to bc for calculation
    else
	echo "Please enter only integers or real numbers"		# if num2 is not a real number it executes
	exit
    fi
else
	echo "Please enter only integers or real numbers"		# if num1 is not a real number it executes
fi
