<<Documentation
NAME         : S.Jagajeevan
DATE         : 20.05.2021
DESCRIPTION  : # Display the names of  file-system which have lessthan 10% free space available
INPUT        : ./29_free_space.sh 
OUTPUT	     :
All file systems are : 
Filesystem     1K-blocks     Used Available Use% Mounted on
udev             3962352        0   3962352   0% /dev
tmpfs             798380     2144    796236   1% /run
/dev/nvme0n1p5  90187772 10352416  75210968  13% /
tmpfs            3991896        0   3991896   0% /dev/shm
tmpfs               5120        4      5116   1% /run/lock
tmpfs            3991896        0   3991896   0% /sys/fs/cgroup
/dev/loop1         56832    56832         0 100% /snap/core18/2066
/dev/loop0         56832    56832         0 100% /snap/core18/1997
/dev/loop2        224256   224256         0 100% /snap/gnome-3-34-1804/66
/dev/loop4         33152    33152         0 100% /snap/snapd/11588
/dev/loop3         52352    52352         0 100% /snap/snap-store/518
/dev/loop5         66688    66688         0 100% /snap/gtk-common-themes/1515
/dev/loop7         32896    32896         0 100% /snap/snapd/11841
/dev/loop6         66432    66432         0 100% /snap/gtk-common-themes/1514
/dev/nvme0n1p1     98304    59151     39153  61% /boot/efi
tmpfs             798376       20    798356   1% /run/user/125
tmpfs             798376       28    798348   1% /run/user/1000

File-system /dev/loop1 have less than 10% of free space 
File-system /dev/loop0 have less than 10% of free space 
File-system /dev/loop2 have less than 10% of free space 
File-system /dev/loop4 have less than 10% of free space 
File-system /dev/loop3 have less than 10% of free space 
File-system /dev/loop5 have less than 10% of free space 
File-system /dev/loop7 have less than 10% of free space 
File-system /dev/loop6 have less than 10% of free space 

Documentation

#!/bin/bash
# Display the names of  file-system which have lessthan 10% free space available

echo "All file systems are : "
df
echo
file=(`df | sed '1d' | tr -s " " | cut -d " " -f 1`) # file system info 1th field i.e, filename is stored in an array except 1st line (sed is used to remove it) 

array=(`df | sed '1d' | tr -s " " | cut -d " " -f 5 | cut -d "%" -f 1`) # file system info 5th field i.e, used percentage is stored in an array except 1st line (sed is used to remove it)

len=${#file[*]}		# length of an array

for i in `seq 0 $(($len-1))`
do
    free_sp=$((100-${array[i]}))						# calculating free space
    if [ $free_sp -lt 10 ]							# checks free space is less than 10 if it is then executes
    then 
	echo "File-system ${file[i]} have less than 10% of free space " 	# print the details of file having less than 10% of free space
    fi
done
