#/usr/bin/env bash

# output common string
echo "Hello,World!"

# multiple commands are separated by ; in a single line
echo a;echo b   # even if the previous command fails,the following command will still be executed normally.

# output escape character
echo "Hello,\"Rekord\""

# output variable
name=Rekord
echo "Hello,\"$name\""

# output multi line string
echo "Yes\nNo"
# use "-e" to print non printable character
echo -e "Yes\nNo"

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


:<<EOF
Single quotation marks are used to retain the literal meaning of characters. 
All kinds of special characters in single quotation marks will become ordinary characters

If you want to use single quotation marks in single quotation marks, you can't use escape.
You need to add a dollar sign ($) in front of the outer single quotation marks, and then escape the inner single quotation marks.
EOF
echo $'it\'s'


:<<EOF
Double quotation marks are looser than single quotation marks. 
Most special characters in double quotation marks will lose their special meaning and become ordinary characters.
EOF
echo *
echo "*"

:<<EOF
Except for three special characters: dollar sign ($), backquote (`), and backslash (\). 
Bash will still have special meaning among the three characters.
EOF
echo "$SHELL"
echo "`date`"
echo "\\"


:<<EOF
The newline character in double quotation marks will lose its special meaning. 
Bash no longer interprets it as the end of the command, but as an ordinary newline character. 
So you can use double quotation marks to enter multiple lines of text on the command line.
EOF
echo "Hello
World
World
World"
echo "<HTML>
    <HEAD>
          <TITLE>Page Title</TITLE>
    </HEAD>
    <BODY>
          Page body.
    </BODY>
</HTML>"
echo "$(cal)"


:<<EOF
Here document is a method of inputting multi line strings. The format is as follows.
```
<< token
text
token
```

Variable replacement will occur inside the here document, and backslash escape is supported, but wildcard extension is not supported. 
Double quotation marks and single quotation marks also lose their grammatical function and become ordinary characters.
EOF

cat << _EOF_
<html>
<head>
    <title>
    The title of your page
    </title>
</head>

<body>
    Your page content goes here.
</body>
</html>
_EOF_

foo='hello world'
cat << _example_
$foo
"$foo"
'$foo'
_example_
cat << '_example_'
$foo
"$foo"
'$foo'
_example_


:<<EOF
The here string is only suitable for commands that can accept standard input as parameters. 
It is not valid for other commands. For example, echo command cannot use the here document as a parameter.
EOF

echo << _example_
hello
_example_


cat <<< 'hi there'