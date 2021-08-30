<<Documentation
NAME         : S.Jagajeevan
DATE         : 18.05.2021
DESCRIPTION  : Count the number of users with user IDs between the given range on the system 
INPUT        : bash 30_print_user_ids.sh 0 100
OUTPUT	     : Total count of user ID between 0 and 100 is is : 16 

Documentation

#!/bin/bash
#Count the number of users with user IDs between the given range on the system 

array=($(cat /etc/passwd | cut -d ":" -f 3))			#FROM THE USER PASSWORD FILE FIRST FIELD IS TAKEN AND IT IS STORED AS AN ARRAY
len=${#array[@]}						#ARRAY LENGTH

count=0								#INITIALIZE COUNT TO 0

if [[ $# -eq 0 ]]						#CHECKING THE ARGUMENTS PASSED OR NOT IF NO MENS THIS EXECUTES
then
    for i in `seq 0 $(($len-1))`
    do
    	if [ ${array[i]} -gt 500 -a ${array[i]} -lt 10000 ]	#CONDITION FOR ARRAY ELEMENTS > 500 AND < 100000
    	then
    	    count=$(($count+1))					#COUNT VALUE INCREMENTED
       	fi
    done
    echo "Total count of user ID between 500 to 10000 is : $count "	#DISPLAY TOTAL COUNTS
    exit
elif [[ $# -eq 1 ]]						#CHECKING NO OF ARGUMENTS IF IT IS 1 IT EXECUTES
then
    echo "Please pass 2 arguments through CL"
    exit
fi

if [[ $2 -lt $1 ]]						#CHECKING ARGUMENTS VALUE IF 2nd ARGMENT IS < 1st ARGUMENT IT EXECUTES
then
    echo "Error : Invalid range. Please enter the valid range through CL"
    exit
fi

for i in `seq 0 $(($len-1))`
do
    if [ ${array[i]} -gt $1 -a ${array[i]} -lt $2 ]		#CONDITION FOR CHECKING ARRAY ELEMENTS > $1 AND < $2
    then
	count=$(($count+1))					#COUNT VALUE INCREMENTED
    fi
done
echo "Total count of user ID between $1 and $2 is is : $count " #DISPLAY TOTAL COUNTS
