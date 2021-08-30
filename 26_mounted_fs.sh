<<Documentation
NAME         : S.Jagajeevan
DATE         : 20.05.2021
DESCRIPTION  : Write a script to determine whether a given file system or mount point is mounted
INPUT        : ./26_mounted_fs.sh /dev/loop1 
OUTPUT	     : File-system /dev/loop1 is mounted on /snap/core18/2066 and it is having 100% used space with 0 KB free 
Documentation

#!/bin/bash
# Write a script to determine whether a given file system or mount point is mounted

if [ $# -eq 0 ]					# checks argument passed or not
then
    echo "ERROR : Please pass the name of the file-system through command line."
    exit
fi

count=0						# initialize count value
file=(`df | tr -s " " | cut -d " " -f 1`)	# file system information 1st field i.e, file name stored in an array		

len=${#file[@]}					# total length of the array

for i in `seq 1 $(($len-1))`
do
    if [[ "${file[i]}" == $1 ]]			# compare the arra element with the given file
    then
	count=$(($count+1))			# increment count value
	a=$i					# store the array order
    fi
done

ava_space=(`df | tr -s " " | cut -d " " -f 4`)  # file system information 4th field i.e, available space is stored in an array

usage=(`df | tr -s " " | cut -d " " -f 5`)	# file system information 5th field i.e, used percentage is stored in an array 

mounted=(`df | tr -s " " | cut -d " " -f 6`)	# file system information 6th field i.e, mounted is stored in an array 

if [ $count -eq 0 ]				# checks count value if t is zero the given argument is not mounted
then 
    echo " $1 is not mounted "
    exit
fi
echo "File-system $1 is mounted on ${mounted[$a]} and it is having ${usage[$a]} used space with ${ava_space[$a]} KB free " # print the details
