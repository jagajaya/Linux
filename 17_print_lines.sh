<<Documentation
NAME         : S.Jagajeevan
DATE         : 15.05.2021
DESCRIPTION  : To print the number of lines from the file
INPUT        : ./14_print_lines.sh 5 3 sample.txt 
OUTPUT	     :
line number 5
line number 6
line number 7

Documentation
#!/bin/bash
#Write a script to rint the contents of the file from given line number to next given number of lines

l1=$1												# inputs are taken from cmd line arguments
l2=$2
tot=$#

if [ $tot -lt 3 ]										# if argument length is lessthan 3 then it executes
then
    echo "arguments missing
    Usage: ./file_print.sh start_line upto_line filename
    For eg: ./20_fileprint.sh 5 5 <file>
    "
    exit
fi

if [ -f $3 -o -e $3 ]										# checking the 3rd agrument is file or not and the file exist or not
then
    lines=$(($1+$2-1))
    len=`cat $3 | wc -l`

    if [ $len -lt $lines ]									# checking the number of lines in the file if it is less then it exexcutes
    then
	echo "Error: $3 is having only $len lines, file should have atleast $lines lines"
	exit
    else
    output=`cat $3 | head -$(($1+$2-1)) | tail -$2`						# condition for printing required lines from the files
    echo "$output"			
    fi

else
    echo " pass the correct file in the argument "						# if the passed 3rd argument wrong filr it executes 
    exit
fi
