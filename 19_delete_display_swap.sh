<<Documentation
NAME		: Jgajeevan.S
DATE		: 23.05.2021
DESCRIPTION	: Script to delete all the .swp files found in your system or directory
INPUT		: ./19_delete_display_swap.sh
OUTPUT		:
/home/jaga/def1.swp
/home/jaga/19PROG/abc3.swp
/home/jaga/19PROG/abc1.swp
/home/jaga/19PROG/abc4.swp
/home/jaga/19PROG/abc2.swp
/home/jaga/def2.swp
/home/jaga/.abc.txt.swp

Documentation
#!/bin/bash
# Script to delete all the .swp files found in your system or directory

if [ $# -eq 0 ]						# checks argument passed or not
then
    check=`find ~ -name "*.swp" | wc -l`		# checks .swp files count
    
    if [ $check -eq 0 ]
    then
    	echo " swp files not found "			# if no file it executes
    else
    	find ~ -name "*.swp"				# .swp files displayed
      	find ~ -name "*.swp" -delete			# .swp files deleted
    fi
else
    cd							# home directory
    if [ -d $1 ]					# checks passed directory present in hime directory or not
    then
	check1=`find $1 -name "*.swp" | wc -l`		# checks .swp files count
	
	if [ $check1 -eq 0 ]
	then
	    echo "No swp files found in $1 "
	else
    	    find $1 -name "*.swp"			# .swp files displayed for given directory
    	    find $1 -name "*.swp" -delete		# .swp files deleted
	fi
    else
	echo "Pass valid directory"			# if directory is not present it executes
    fi
fi
