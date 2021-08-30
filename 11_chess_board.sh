<<Documentation
NAME         : S.Jagajeevan
DATE         : 11.05.2021 
DESCRIPTION  : Write a script to print chess board
INPUT        : ./11_chess_board.sh
		(num=8) inside a file already given
OUTPUT       : 
Documentation
#!/bin/bash
# Write a script to print chess board

num=8						# CHESS BOARD INPUT FOR 8X8
add=0
for i in `seq $num`
do
	for j in `seq $num`
	do
	    add=$((i+j))			
	    n=`expr $add % 2`
	    if [ $n -eq 0 ]			# CHECKING I % J VALUE
	    then
		echo -e -n "\e[47m" " "		# IF IT IS 0 PRINT WHITE BOX
	    else
		echo -e -n "\e[40m" " "		# IF IT IS 1 PRINT BLACK BOX
	    fi
	done
	echo
done
echo -e -n "\e[0m" " "				# TO MAKE IT NORMAL COLOUR AFTER THE CHESS BOARD EXECUTION
