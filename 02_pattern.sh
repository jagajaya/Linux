<<Documentation
NAME         : S.Jagajeevan
DATE         : 09.05.2021
DESCRIPTION  : Read n and generate a pattern given below
INPUT        : ./02_pattern.sh
		ENTER THE NUMBER : 4
OUTPUT       : 
1 
2 3 
4 5 6 
7 8 9 10 
Documentation
#!/bin/bash
# Read n and generate a pattern given below
 
echo -n " ENTER THE NUMBER : "						# read the input from user
read num
limit=$((2**5))								# limit for condition checking
if [ 2 -lt $num -a $num -lt $limit ]					# checking whether the number lies between 2 and 32
then
    sum=0
    for i in `seq $num`
    do
	for j in `seq $i`
	do
	    sum=$(($sum+1))
	    echo -n "$sum "						# printing the sequence
	done
	echo
    done
else
	echo "Number out of range,Please enter 2 < number < 2^5"	# if number is out of range it shows in the terminal
fi
