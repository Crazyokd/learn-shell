#/usr/bin/env bash

# output common string
echo "Hello,World!"

# output escape character
echo "Hello,\"Rekord\""

# output variable
name=Rekord
echo "Hello,\"$name\""

# output multi line string
echo "Yes\nNo"

# open escape character and output multi line string
echo -e "Yes\nNo"

# open escape character and don't output multi line string
echo -e "Yes\c"
echo "No"

# redirect output to file
echo "test redirect" > test.txt

# echo command
echo `pwd`