<<Documentation
NAME         : S.Jagajeevan
DATE         : 15.05.2021
DESCRIPTION  : Script to search a user present in your system
INPUT        : ./32_user_present.sh xyz
OUTPUT	     :  xyz not present

Documentation

#!/bin/bash
#Script to search a user present in your system

array=($(cat /etc/passwd | cut -d ":" -f 1))			#FROM THE USER PASSWORD FILE FIRST FIELD IS TAKEN AND IT IS STORED AS AN ARRAY
total=${#array[@]}						#ARRAY LENGTH

if [ $# = 0 ]							#CHECKING ARGUMENTS PASSED OR NOT
then
    echo "Error : Please pass the argument through command line"
    exit
fi

count=0								#INITIALIZE COUNT = 0

for i in `seq 0 $(($total-1))`
do
    if [[ $1  == "${array[i]}" ]]				#COMPARING TWO STRINGS ( GIVEN INPUT THROUGH CMD LINE ARG VS ALL ARRAY ELEMENTS )
    then
	echo " $1 is present "					#PRINTING THWE GIVEN ELEMENT IS PRESENT OR NOT
    else
	count=$((count+1))					#COUNT INCREMENT IF THE CONDITION IS FALSE AND IF THE GIVEN STRING IS NOT PRESENT IT EQUALS TOTAL ARRAY LENGTH
    fi
done

if [ $count -eq $total ]					#CHECKING THE COUNT VALUE IF IF IS = ARRAY LENGTH IT MEANS THE GIVEN STRING IS NOT PRESENT IN AN ARRAY
then
    echo " $1 not present"
fi
