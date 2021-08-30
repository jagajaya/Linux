<<Documentation
NAME         : S.Jagajeevan
DATE         : 15.05.2021
DESCRIPTION  : Script for generating random 8-caracter passwords including alpha numeric characters
INPUT        : ./20_random_password.sh
	        Enter how many times you want to print random password 3
OUTPUT	     : x9yWc`S,
	       tu;^fS3`
	       zV;q~wM)

Documentation

#!/bin/bash
#Script for generating random 8-caracter passwords including alpha numeric characters
read -p " Enter how many times you want to print random password " n
if [ $n -lt 1 ]
then
    echo " Please enter positive integers"
    exit
fi
for i in `seq $n`
do
    cat /dev/urandom | tr -cd [:print:] | head -c 8	
    echo
    #  from the /dev/urandom file we take the password
    # -cd complementing the non readable files to readable and to delete the spaces from print
    # [:print;] is t print all characters including spaces
    # from head -c 8 the first 8 charcters (bytes) is to be printed (Each  time they generate different characters)
done
