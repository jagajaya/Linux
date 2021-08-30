<<Documentation
NAME         : S.Jagajeevan
DATE         : 19.05.2021
DESCRIPTION  : To print the number of lines from the file
INPUT        : bash 25_recursion.sh How are you? I am fine
OUTPUT	     :
How
are
you?
I
am
fine

Documentation

#!/bin/bash
# Use arecursive function to print each argument passed to the function

if [ $# = 0 ]							# checks  CLA passed or not
then
    echo "Error : Pass the arguments through command line."
    exit
fi

arr=($@)							# CLA is store as an array

len=${#arr[@]}							# array length
i=0							

function recursion()						#fuction name
{
    if [ $i -lt $len ] 						# compares the length of array if it is with in the array length it executes else it comes out 
    then
	echo ${arr[$i]}						# print array element wise
    else
	exit
    fi
    i=$(($i+1))							# increment i by 1
    recursion							# function call (recursion)
}
recursion							#function call
