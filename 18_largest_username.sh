<<Documentation
NAME         : S.Jagajeevan
DATE         : 15.05.2021
DESCRIPTION  : Display the longest and shortest user names on the system
INPUT        : ./18_largest_username.sh
OUTPUT:
The Longest Name is:	gnome-initial-setup
The Shortest Name is:	lp
Documentation

#!/bin/bash
#Display the longest and shortest user names on the system

array=($(cat /etc/passwd | cut -d ":" -f 1))			#FROM THE USER PASSWORD FILE FIRST FIELD IS TAKEN AND IT IS STORED AS AN ARRAY
total=${#array[@]}						#ARRAY LENGTH
lar=${array[0]}							#FIRST ELEMENT IS TAKEN ( AS LONGEST)
lar_size=${#array[0]}						#LENGTH OF FIRST ELEMENT (AS LONGEST)

for i in `seq 1 $(($total-1))`
do
    if [ $lar_size -lt ${#array[i]} ]				#COMPARING LENGTH OF ARRAYS ( LONGEST VS OTHER ARRAY ELEMENTS )
    then
	lar=${array[i]}						#LONGEST ARRAY ELEMENT IS STORED
	lar_size=${#array[i]}					#LONGEST ARRAY ELEMENT LENGTH IS STORED
    fi
done

small=${array[0]}						#FIRST ELEMENT IS TAKEN ( AS SHORTEST )
sma_size=${#array[0]}						#LENGTH OF FIRST ELEMENT (AS SHORTEST)

for i in `seq 1 $(($total-1))`
do
    if [ $sma_size -gt ${#array[i]} ]				#COMPARING LENGTH OF ARRAYS ( SHORTEST VS OTHER ARRAY ELEMENTS )
    then
	small=${array[i]}					#SHORTEST ARRAY ELEMENT IS STORED
	sma_size=${#array[i]}					#SHORTEST ARRAY ELEMENT LENGTH IS STORED
    fi
done

echo "The Longest Name is:	$lar"
echo "The Shortest Name is:	$small"				# PRINTING THE SMALLEST AND LARGEST ARRAY ELEMENT WHICH WE STORED 
