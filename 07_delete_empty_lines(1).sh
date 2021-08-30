<<Documentation
NAME         : S.Jagajeevan
DATE         : 10.05.2021
DESCRIPTION  : Write a script to delete empty lines from the file
INPUT        : ./07_delete_empty_lines.sh file.txt 
OUTPUT       : 
File with emplty lines 
hi

hello
hoe aqre you
name some fruits:
apple

mango
orange

grapes

Empty lines are deleted
hi
hello
hoe aqre you
name some fruits:
apple
mango
orange
grapes

Documentation

#!/bin/bash
# Write a script to delete empty lines from the file

if [ $# -eq 0 ]							# if no argument is passed this executes 
then
    echo "Please pass the file name through command line"
    exit
fi

print=`cat $@`							# original file which we passed  with empty lines is to be printed
echo "File with emplty lines  "
echo "$print"
echo
sed -i '/^[[:blank:]]*$/d' $@					# sed command is used to delete the empty lines and the empty spaces in empty lines for the required file we passed 
echo "Empty lines are deleted"
print=`cat $@`
echo "$print"							# file without empty lines is printed
