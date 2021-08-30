<<Documentation
NAME         : S.Jagajeevan
DATE         : 17.05.2021
DESCRIPTION  : Use pipes or redirection to create an infinite feedback loop
INPUT        :./24_redirection.sh       
OUTOUT       :
Before loop file contents
Hai hello
After loop file contents
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello


Documentation

#!/bin/bash
# Use pipes or redirection to create an infinite feedback loop
echo "Hai Hello" > hello.txt
echo "Before loop file contents "
cat hello.txt						# to print file before looping

sleep 10

echo "After loop file contents "
tail -f hello.txt >> hello.txt | tail -f hello.txt 	# to append the file contents to the same file for infinite times
