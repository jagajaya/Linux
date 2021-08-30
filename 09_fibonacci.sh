<<Documentation
NAME         : S.Jagajeevan
DATE         : 10.05.2021 
DESCRIPTION  : Write a script to read 'n' and generate fibonacci numbers <= n
INPUT        : ./_09_fibonacci.sh
		Enter limit for the series: 10
OUTPUT       : 0, 1, 1, 2, 3, 5, 8,
Documentation
#!/bin/bash
# Write a script to read 'n' and generate fibonacci numbers <= n

read -p " Enter limit for the series : " n				# READ THE INPUT FROM THE USER

var='^[0-9]+$'
var1='^[+-]?[0-9]?+$'
if ! [[ $n =~ $var ]]							# IF INPUT IS NOT A NUMBER THIS EXECUTES AND EXIT 
then
    if [[ $n =~ $var1 ]]						# THIS CHECKS THE NUMBERS IS NEGATIVE OR NOT (TO AVOID ERROR STATEMENT)
    then
	if [ $n -lt 0 ]							# THIS CHECKS NUMBER IS LESSTHEN 0 OR NOT THEN EXECUTES AND EXIT 
	then
    	echo " Please enetr only positive numbers "
    	exit
	fi
    fi
    echo " Please enter only numbers "	
    exit	    
fi

num1=0
num2=1

while [ $n -ge $num1 ]							# LOOP FOR PRINTING THE FIBONACCI SERIES UPTO THE GIVEN INPUT
do
    echo -n  " $num1, "
   fib=$(($num1+$num2))
   num1=$num2
   num2=$fib 
done
echo
