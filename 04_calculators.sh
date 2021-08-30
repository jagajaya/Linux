<<Documentation
NAME         : S.Jagajeevan
DATE         : 09.04.2021 
DESCRIPTION  : Write a script for arithmetic calculator using command line arguments
INPUT        : ./04_ calculator.sh 25 + 41
OUTPUT       : 25 + 41 = 67
Documentation
#!/bin/bash
# Write a script for arithmetic calculator using command line arguments

if [ $# -eq 0 ]							# checking whether the argument is passed or not
then
    echo "Please pass the arguments through command line."
    exit
fi

if [ $# -lt 3 ]							# checking minimum number of arguments need to be passed
then
    echo "Please pass 3 arguments."
    exit
fi

case $2 in							# 2nd argument is taken in case for specified operation
    +)
	sol=`expr " $1 + $3 " | bc`				# addition 
	echo " $@ = $sol "
	;;
    -)
	sol=`expr " $1 - $3 " | bc`				# subraction
	echo " $@ = $sol "
	;;
    x)
	sol=`expr " $1 \* $3 " | bc`				# multiplication
	echo " $@ = $sol "
	;;
    /)
	sol=` echo "scale=2;(($1/$3))" | bc`			# division
	echo " $@ = $sol "
	;;
    *)
	echo " Please pass the valid arguments"			# if the 2nd argument is not taken in case for operation  it displays in terminal
	;;
esac
