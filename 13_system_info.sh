<<Documentation
NAME         : S.Jagajeevan
DATE         : 11.05.2021
DESCRIPTION  : writing a script to print system information
INPUT        : ./13_system_info.sh 
OUTPUT       :

1.Currently logged users 
2.Your shell directory
3.Home directory
4.OS name & version
5.Current working directory
6.Number of users logged in
7.Show all available shells in your system
8.Hard disk information
9.CPU information
10.Memory informations
11.File system informations
12.Currently running process 
	  
Enter the choice : 2
Your shell directory is /bin/bash
Do you want to continue (y/n)?y

1.Currently logged users 
2.Your shell directory
3.Home directory
4.OS name & version
5.Current working directory
6.Number of users logged in
7.Show all available shells in your system
8.Hard disk information
9.CPU information
10.Memory informations
11.File system informations
12.Currently running process 
	  
Enter the choice : 13
Invalid option please enter valid option 
Do you want to continue (y/n)?n
 
Documentation

#!/bin/bash
# Write a script to print the following :

function system								# FUNCTION CALL
{
    echo "1.Currently logged users 
2.Your shell directory
3.Home directory
4.OS name & version
5.Current working directory
6.Number of users logged in
7.Show all available shells in your system
8.Hard disk information
9.CPU information
10.Memory informations
11.File system informations
12.Currently running process 
	  "
     echo -n  "Enter the choice : "
     read choice							#READ INPUT FROM USER

case $choice in
    1)
	echo -n "Currently logged users is "
	whoami								#COMMAND FOR CURRENTLY LOGGED USERS 
	;;
    2)
	echo -n "Your shell directory is "
	echo $SHELL							#COMMAND FOR SHELL DIRECTORY
	;;
    3)
	echo -n "Home directory is "
	echo $HOME							#COMMAND FOR HOME DIRECTORY
	;;
    4)
	name=`uname`							#OS NAME COMMAND
	version=`uname -r`						#OS VERSION COMMAND
	echo -n "OS name & version is "
	echo " $name  &  $version "
	;;
    5)
	echo -n "Current working directory is "
	pwd								#CURRENT WORKING DIRECTORY COMMAND
	;;
    6)
	echo -n "Number of users logged in is "
	w								#COMMAND TO VIEW NUMBER OF USER LOGGED IN
	;;
    7)
	echo  "All available shells in your systems are "
	cat /etc/shells							#TO SEE ALL VAILABLE SHELLS
	;;
 	
    8)
	echo  "Hard disk information "
	df -h								#HARD DIDK INFO COMMAND
	;;
    9)
	echo  "CPU information "
	cat /proc/cpuinfo						#CPU INFO COMMAND
	;;
    10)
	echo  "Memory informations "
	cat /proc/meminfo						#MEMORY INFO COMMAND
	;;
    11)
	echo  "File system information "
	cat /proc/filesystems						#FILE INFO COMMAND
	;;
    12)
	echo "Currently running process is "
	ps								#CURRENTLY RUNNING PROCESS COMMAND
	;;
    *)
	echo "Invalid option please enter valid option "
	;;
esac
}

system									#FUNCTION CALL 

while [ 0 -lt 1 ]							#CONDITION FOR ASKING THE QUESTION N TIMES TO THE USER
do
    echo -n "Do you want to continue (y/n)?"
    read opt								#READ INPUT [y OR OTHERS]
    echo
    if [ $opt == y ]							#IF IT IS y THEN IT EXECUTES OTHERWISE EXIT
    then
	system
    else
	exit
    fi
done
