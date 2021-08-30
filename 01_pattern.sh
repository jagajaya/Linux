<<Documentation
NAME         : S.Jagajeevan
DATE         : 09.05.2021
DESCRIPTION  : Read n and generate a pattern given below
INPUT        : ./01_pattern.sh
		ENTER THE NUMBER  : 4
OUTPUT       :
1 
1 2 
1 2 3 
1 2 3 4 

Documentation
#!/bin/bash
# Read n and generate a pattern given below

read -p "ENTER THE NUMBER : " num					# read the number from the user
limit=$((2**5))								# setting the limit 
if [ 2 -lt $num -a $num -lt $limit ]					# check whether the number is between 2 and 32
then
    for i in `seq $num`
    do
	for j in `seq $i`
	do
	    echo -n "$j "						# printing the sequence 
	done
	echo
    done
else
	echo "Number out of range,Please enter 2 < number < 2^5"	# if number is out of range it shows in the terminal
fi
