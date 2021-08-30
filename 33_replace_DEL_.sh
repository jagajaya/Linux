<<Documentation
NAME		: Jgajeevan.S
DATE		: 24.05.2021
DESCRIPTION	: Script to replace 20% of lines in a file randomly and replace it with pattern <----DEL--->
INPUT		: ./33_replace_DEL_.sh abc.txt 
output		:
line 1
line 2
line 3
line 4
line 5
line 6
<---DELETED--->
line 8
line 9
<---DELETED--->
<---DELETED--->
line 12
line 13
line 14
line 15
line 16

Documentation

#!/bin/bash
# Script to replace 20% of lines in a file randomly and replace it with pattern <----DEL--->

if [ $# -eq 0 ]								# if no CLA is passed it executes and exit
then
    echo "Error : Please pass the file name through command line."
    exit

elif ! [ -f $1 -a -e $1 ]						# if file is not exist it executes and exit 
then
    echo "Error : No such a file."
    exit

elif ! [ -s $1 ]								# checks if file is empty or not and exit
then
    echo "Error : $1 is empty file.So can't replace the string."
    exit
fi

t_lines=`cat $1 | wc -l`						# total lines in a file
if [[ $t_lines -lt 5 ]]						# if total line < 5 it executes
then
    echo "Error : $1 file has lessthan 5 lines.So can't replace the string."
    exit
else
    n_line=$(($t_lines*1/5))					# number of lines to be replaced for (calculating 20% of lines)
    pr_lines=(`shuf -n $n_line -i 1-$t_lines`)			# shuffle lines for  20 % from tota lines coun

    for i in ${pr_lines[@]}						# loop for that shuffeld lines array
    do
	sed -i $i's/^[[:print:]]*/<---DELETED--->/' $1		# replace that particular line with given elements
    done 
    cat $1
fi

