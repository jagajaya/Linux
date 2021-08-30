<<Documentation
NAME         : S.Jagajeevan
DATE         : 15.05.2021
DESCRIPTION  : To print the 5th line of a file passes through command line
INPUT        : ./23_print_fifth_line.sh file1.txt 
OUTPUT	     : Error: file1.txt is having only 2 lines. So can't print 5th line.
Documentation

#!/bin/bash
#To print the 5th line of a file passes through command line

file=$@										# input of the file is taken from cmd line argument
len=$#

if [ $len -lt 1 ]								# if there is no argument... then it executes
then
    echo "Please pass the file name in command line"
    exit
fi

if [ -f $@ -o -e $@ ]								# checking the $@ agrument is file or not and the file exist or not
then
    len=`cat $@ | wc -l`

    if [ $len -lt 5 ]								# checking the number of lines in the file if it is less then 5 then it exexcutes
    then
	echo "Error: $@ is having only $len lines. So can't print 5th line."
	exit
    else
    output=`cat $@ | head -5 | tail -1`					    	# condition for printing 5 th line from the file
    echo "Fifth line of the $@ is $output"		
    fi
else
    echo " Error: No such a file."						# if the passed argument wrong file it executes 
    exit
fi
