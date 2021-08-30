<<Documentation
NAME         : S.Jagajeevan
DATE         : 19.05.2021
DESCRIPTION  : Script to take any number of directories as CLA and then list the contents of these directories
INPUT        : ./27_output_ls.sh happy ~/ECEP/
OUTPUT	     : 27_output_ls.sh : Cannot access 'happy' : No such a file or directory. 
		
	       /home/jaga/ECEP
               C DS LS MC
Documentation

#!/bin/bash
# script to take any number of directories as CLA and then list the contents of these directories

if [ $# = 0 ]			# checks argument passed or not
then
    echo *			# list the contents of current directory
    exit
fi

for i in $@			# putting CLA in for loop 
do
    if [ -e $i -a -d $i ]	# checks diectory exist or not
    then
    	cd  $i			# move to that directory
	pwd			# to show present working directory
    	echo *			# list the contents of that directory
	echo
    else
        echo " 27_output_ls.sh : Cannot access '$i' : No such a file or directory. " # error printing
	echo
    fi
done
