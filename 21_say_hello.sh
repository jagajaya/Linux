<<Documentation
NAME         : S.Jagajeevan
DATE         : 16.05.2021
DESCRIPTION  : Script to search a user present in your system
INPUT        : ./21_say_hello.sh
	       Inside ~/.bashrc file ( bash /home/jaga/ECEP/LS/Lab_Assignment/21_say_hello.sh)
OUTPUT	     : Good Noon user, Have a nice day!
	       This is Sunday 16 in May of 2021 (01:02:39 PM)

Documentation

#!/bin/bash
#Write a script called say_hello, which will print greetings based on time

time=`date | cut -d " " -f 5 | cut -d ":" -f 1`							# to find the time 

find=`date | cut -d " " -f 6`									# to find AM or PM

if [ $find == AM ]										# comparing if it is AM then the other conditions will excutes
then
   if [ $time -ge 5 -a $time -lt 12 ]
   then
       say=`echo "Good Morning"`
   fi
   if [ $time -lt 5 -a $time -ge 12 ]
   then
       say=`echo "Good Night"`
   fi
elif [ $find == PM ]										# comparing if it is PM then the other conditions will executes 
then 
   if [ $time -eq 12 -o $time -eq 1 ]
   then
       say=`echo "Good Noon"`
   fi
   if [ $time -ge 2 -a $time -lt 5 ]
   then
       say=`echo "Good Afternoon"`
   fi
   if [ $time -ge 5 -a $time -lt 9 ]
   then
       say=`echo "Good Evening"`
   fi
   if [ $time -ge 9 -a $time -lt 12 ]
   then
       say=`echo "Good Night"`
   fi
fi
echo "$say user, Have a nice day!"								# to say the greeting

echo "This is `date +%A` `date +%d` in `date +%B` of `date +%Y` (`date +%r | cut -d " " -f 1,2`)" # to display Day , Date , Month , Year and Time .....
