<<Documentation
NAME         : S.Jagajeevan
DATE         : 10.05.2021
DESCRIPTION  : Write a script to print the length of each and every string using arrays
INPUT        :  ./10_string_length.sh hello hai how are you ?
OUTPUT	     :
 Length of string (hello)	-	5  
 Length of string (hai)		-	3  
 Length of string (how)		-	3  
 Length of string (are)		-	3  
 Length of string (you)		-	3  
 Length of string (?)		-	1  
Documentation
#!/bin/bash
# Write a script to print the length of each and every string using arrays

array=($@)									# COMMAND LINE ARGUMENT IS STORED AS AN ARRAY
len=`echo ${#array[@]}` 							# LENGTH OF AN ARRAY
if [ $len -eq 0 ]								# CHECK WHETHER THE ARGUMENT IS PASSED OR NOT
then
    echo "Please pass the commands through the argument line "
    exit
fi
for i in `seq 0 $((len-1))`							# LOOP FOR PRINTING EACH ARGUMRNT IN A ARRAY
do
    echo  " Length of string (${array[$i]})		-	${#array[$i]}  "
done

