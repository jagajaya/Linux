<<Documentation
NAME         : S.Jagajeevan
DATE         : 12.05.2021
DESCRIPTION  : Write a script to sort a given number in ascending or descending order
INPUT        : ./12_sorting.sh -a 5 4 6 2 3 8 9 7 1
OUTPUT       : Ascending order of array is  1  2  3  4  5  6  7  8  9  
Documentation

#!/bin/bash
# Write a script to sort a given number in ascending or descending order

array=($@)						#command line input is saved into an array

len=${#array[*]}					#array length is saved into a variable

if [ $len -eq 0 ]					#length checking if it is 0 then exit
then
    echo " Please pass the argument "
    exit
fi

value=${array[0]}					#taking 1st array value (i.e) operator for using in case condition

case $value in
    -a)
	for i in `seq 1 $len`				#i value from 2nd array element to last aray element
	do
    	    for j in `seq $i $len`			#j value from ith array element to last array element
    	    do
        	if [[ ${array[i]} -gt ${array[j]} ]]	#comparing 2 array elements
		then
	    	    temp=${array[$i]}				
	    	    array[$i]=${array[$j]}
	   	    array[$j]=$temp			#finally array order changed in ascending order as per the loop condition
		fi
  	    done
	done

	echo  -n " Ascending order of array is "
	for i in `seq 1 $len`
	do
	echo -n  ${array[$i]} " " 			#array elements printd in ascending order
        done
	echo
	;;
    -d)
	for i in `seq 1 $len`				
	do
    	    for j in `seq $i $len`			
    	    do
        	if [[ ${array[i]} -lt ${array[j]} ]]	#comparing 2 array elements
		then
	    	    temp=${array[$i]}				
	    	    array[$i]=${array[$j]}
	    	    array[$j]=$temp			#finally array order changed in descending order as per the loop condition
		fi
    	    done
	done

	echo -n " Descending order of an array is "
	for i in `seq 1 $len`
	do
	echo -n  ${array[$i]} " " 			#array element printing in descending order
        done
	echo
	;;
    *)
	echo " Please pass the choice"			#if no choice if passed
 esac
