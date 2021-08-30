<<Documentation
NAME         : S.Jagajeevan
DATE         : 17.05.2021
DESCRIPTION  : Shell script to convert string lower to upper and upper to lower
INPUT        :./22_upper_lower.sh file1.txt 
OUTPUT	     :
Please select the option : 1
HI
HELLO

Documentation

#!/bin/bash
#Shell script to convert string lower to upper and upper to lower

if [ $# -eq 0 ]								# checks argument passed or not
then
    echo "Error : Please pass the file name through command line."
    exit
fi

if [ -e $1 ]							# checks the file have any content or not
then
    count=0
    if [ -s $1 ]							# checks file exits or not if exists then count value incremented
    then
    count=$(($count+1))
    fi
    if [ $count -eq 0 ]						# checks count = 0 or not if it is zero the fie doesnnot have any contents
    then
    	echo "Error : No contens inside a file."
    	exit
    fi
    
    echo -n "Please select the option : "
    read n									# ask user for coversion
    if [ $n -eq 1 ]
    then
	tr a-z A-Z < $1							# lower to upper case of given file 

    elif [ $n -eq 2 ]
    then
	tr A-Z a-z < $1							# upper to lower case of given file

    else
    echo " Please enter 1 or 2 for conversion"
    fi
else
    echo "Error : file is not exist."
    exit
fi

