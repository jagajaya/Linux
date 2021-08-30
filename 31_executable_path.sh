<<Documentation
NAME		: Jgajeevan.S
DATE		: 23.05.2021
DESCRIPTION	: For each directory in the PATH, display the number of executable files in that directory
INPUT		: ./31_executable_path.sh 
OUTPUT		:
Current dir: /usr/local/sbin
Current count : 0

Current dir: /usr/local/bin
Current count : 0

Current dir: /usr/sbin
Current count : 374

Current dir: /usr/bin
Current count : 1423

Current dir: /sbin
Current count : 374

Current dir: /bin
Current count : 1423

Current dir: /usr/games
Current count : 4

Current dir: /usr/local/games
Current count : 0

Current dir: /snap/bin
Current count : 3

Total = 3601

Documentation

#!/bin/bash
# For each directory in the $PATH, display the number of executable files in that directory

array=(`echo $PATH | tr : " "`)		# All path variable (absolute pah to executable files) is stored in array
total=0					# initialize total to 0

for i in ${array[@]}			# for loop execution of array elemnts
do
    echo "Current dir: $i"		# print the curent directory ( absolute path )
    
    cd					# move to home directory
    cd $i				# move to that absolute path directory
    array2=(`ls`)			# all elements in that directory is stored in an array
    count=0				# initialize count to 0

    for j in ${array2[@]}		# for loop execution for array2 elements
    do
	if [ -x $j ]			# checks executable or not
	then
	    count=$(($count+1))		# count value incremented
	fi
    done
    total=$(($total+$count))		# total gets incremented after each array2 execution
    echo "Current count : $count"	# print the current count
    echo
done
echo "Total = $total" 			# print total counts

