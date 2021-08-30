<<Documentation
NAME         : S.Jagajeevan
DATE         : 10.05.2021
DESCRIPTION  : Write a script to performarithmetic operation on digits of a given number depending upon the operator
INPUT        : ./08_operator_dependent.sh 1234+
OUTPUT       : Sum is 10
Documentation

#!/bin/bash
# Write a script to performarithmetic operation on digits of a given number depending upon the operator
 
num=$@						# COMMAND LINE ARGUMENT VALUE IS STORED IN VARIABLE
len=${#num}

if [ $len -eq 0 ]
then
    echo " Please pass the argument "
    exit
fi

ans=${num:0:1}					# FIRST OFFSET VALUE IS TAKEN 

val=${num:(($len-1))}				# LAST OFFSET VALUE IS TAKEN (i.e) OPERATOR


case $val in					# CASE FOR OPRATION
    +)

	for i in `seq 1 $((len-2))`		# LOOP FROM 2ND OFFSET TO LAST OFFSET BEFORE OPERATOR
	do
    		a=${num:$i:1}
    		ans=$((ans+a))			# ADDITION
	done
	echo "Sum is $ans"
	;;
    -)
	for i in `seq 1 $((len-2))`
	do
    		a=${num:$i:1}
    		ans=$((ans-a))			# SUBTRACTION
	done
	echo "Sub is $ans"
	;;
    x)
	for i in `seq 1 $((len-2))`
	do
    		a=${num:$i:1}
    		ans=$((ans*a))			# MULTIPLICATION
	done
	echo "Mul is $ans"
	;;
    /)
	for i in `seq 1 $((len-2))`
	do
    		a=${num:$i:1}
    		ans=`echo "scale=2; $ans / $a" | bc`	# DIVISION
	done
	echo "Div is $ans"
	;;
    *)
	echo "Operator missing"			# IF OPERATOR IS NOT PASSED THEN IT WILL EXECUTE
	;;
esac
