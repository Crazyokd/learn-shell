#/usr/bin/env bash

# output common string
echo "Hello,World!"

# output multi-line string
echo "<HTML>
    <HEAD>
          <TITLE>Page Title</TITLE>
    </HEAD>
    <BODY>
          Page body.
    </BODY>
</HTML>"

# multiple commands are separated by ; in a single line
echo a;echo b   # even if the previous command fails,the following command will still be executed normally.

# output escape character
echo "Hello,\"Rekord\""

# output variable
name=Rekord
echo "Hello,\"$name\""

# output multi line string
echo "Yes\nNo"
# open escape character
echo -e "Yes\nNo"
echo -e 'Yes\nNo'

# cancel output newline
echo -n "YES"
# open escape character and don't output multi line string
echo -e "Yes\c"
echo "No"

# one command multiple lines write,use \ to separate
echo foo bar
echo foo \
bar

# redirect output to file
echo "test redirect" > test.txt

# echo command
echo `pwd`