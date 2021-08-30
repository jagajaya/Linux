<<Documentation
NAME		: Jgajeevan.S
DATE		: 23.05.2021
DESCRIPTION	: Script to locks down file permissions for a particular directory
INPUT		: bash 28_lock-permissions.sh ~/RENAME/
OUTPUT		:
Before locking
total 20
-rwxrwxr-x 1 jaga jaga 1093 May 19 22:48 14_file_upper_lower.sh
drwxrwxr-x 4 jaga jaga 4096 May 21 19:17 DIR1
drwxrwxr-x 2 jaga jaga 4096 May 18 20:06 DIR2
drwxrwxr-x 2 jaga jaga 4096 May 18 14:08 DIR3
-rw-rw-r-- 1 jaga jaga    9 May 23 14:09 file1.txt
-rw-rw-r-- 1 jaga jaga    0 May 18 20:07 file2.txt
-rw-rw-r-- 1 jaga jaga    0 May 18 20:07 file3.txt

After locking
total 20
-rwx------ 1 jaga jaga 1093 May 19 22:48 14_file_upper_lower.sh
drwx------ 4 jaga jaga 4096 May 21 19:17 DIR1
drwx------ 2 jaga jaga 4096 May 18 20:06 DIR2
drwx------ 2 jaga jaga 4096 May 18 14:08 DIR3
-rw------- 1 jaga jaga    9 May 23 14:09 file1.txt
-rw------- 1 jaga jaga    0 May 18 20:07 file2.txt
-rw------- 1 jaga jaga    0 May 18 20:07 file3.txt

Documentation

#!/bin/bash
# Script to locks down file permissions for a particular directory

if [ $# -eq 0 ]						# checks CLA passed or not
then
    echo "Please pass the directory in command line "
    exit
fi

if [ -d $1 ]						# checks passed CLA is directory or not 
then
    cd 							# move to home directory
    cd $1						# move to the specified directory

    echo "Before locking"
    ls -l $1						# print contents in that dir brfore locking
    echo

    echo "After locking"
    chmod -R go-rwx $1					# change the modes of specified directory ( for groups and others )
    ls -l $1						#  print the contents in that dir after locking

else 							# if the CLA is not a directory it executes
    echo "Please pass the valid directory "
fi

