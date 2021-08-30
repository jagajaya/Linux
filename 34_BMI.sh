<<Documentation
NAME         : S.Jagajeevan
DATE         : 09.05.2021
DESCRIPTION  : Read n and generate a pattern given below
INPUT        : ./34_BMI.sh
		Enter the weight in Kg : 45.5
		Enter the height in meters : 1.5
OUTPUT       : You are Normal

Documentation

#!/bin/bash
# WAS to calculate the BMI

echo  -n "Enter the weight in Kg : " 
read w							# READ THE WEIGHT
echo -n "Enter the height in meters : "
read h							# READ THE HEIGHT FROM THE USER
check='^[+-]?[0-9]?+[.]?[0-9]+$'

if ! [[ $w =~ $check ]]                                 # IF WEIGHT IS NOT A NUMBER THIS EXECUTES AND EXIT 
then
    echo " Invalid input "
    echo " Please enter only positive values "
    exit
fi

if ! [[ $h =~ $check ]]                                 # IF HEIGHT IS NOT A NUMBER THIS EXECUTES AND EXIT
then
    echo " Invalid input "
    echo " Please enter only positive values "
    exit
fi

check_w=`echo " $w > 0 " | bc`				# CHECKING WEIGHT IF IT IS LESS THAN 0 OR NOT EVEN FOR REAL NUMBERS TOO (0 OR 1 )

check_h=`echo " $h > 0 " | bc`				# CHECKING HEIGHT ..............."""" (0 OR 1)

if [ $check_w -eq 0 -o $check_h -eq 0 ]			# IF ANY ONE OF THE VALUE IS NEGATIVE IT EXECUTES AND EXIT
then
     echo " Invalid input "
     echo " Please enter only positive values "
     exit
fi

h2=`echo "scale=2; $h * $h" | bc`			# HEIGHT * HEIGHT
bmi=`echo "scale=1; $w / $h2" | bc`			# BMI CALCULATION

uw=`echo " $bmi < 18.5 " | bc`				# CHECKING BMI IS LESSTHAN 18.5 ( IF YES 1 , ELSE 0 ) AND STORED IN uw

no=`echo " $bmi >= 18.5 && $bmi <= 24.9 " | bc`		# CHECKING BMI IS GREATER THAN OR EQUAL TO 18.5 AND LESSTHAN OR EQUAL TO 24.9 (0 OR 1 ) AND STORED IN no

ow=`echo " $bmi >= 25 && $bmi <= 29.9  " | bc`		# CHECKING BMI >= 25 AND BMI <= 29.9 ( 0 OR 1 ) AND STORED IN ow

ob=`echo " $bmi >= 30 " | bc`				# CHECKING BMI >= 30 (0 OR 1) AND STORED IN 0b

if [[ $uw -eq 1 ]]					# CONDITION CHECKING AND UNDERWEIGHT EXECUTION (uw = 1 or not )
then
    echo "You are Underweight"
elif [[ $no -eq 1 ]]					# NORMAL WEIGHT EXECUTION (no = 1 or not )
then
    echo "You are Normal "
  
elif [[ $ow -eq 1 ]]					# OVER WEIGHT EXECUTION ( ow = 1 or not )
then
    echo "You are Overweight "

elif [[ $ob -eq 1 ]]					# OBESE EXECUTION ( ob = 1 or not )
then
    echo "You are obese"
fi
