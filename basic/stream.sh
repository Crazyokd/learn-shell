#!usr/bin/env bash

:<<EOF
Input and output streams
Bash receives input and generates output in the form of a character sequence or character stream. These streams can be redirected to a file or another stream.
There are three file descriptors:
code 	 descriptor  	 describe
zero 	 stdin 	     Standard input
one 	 stdout 	 standard output 
two 	 stderr 	 Standard error output


redirect
Redirection allows us to control where the input of a command comes from and where the output results go. These operators are used to control the redirection of flow:
Operator 	 Description
> 	        redirect output
&> 	        Redirect output and error output
&>> 	    Redirect output and error output in additional form
< 	        redirect input
<< 	        Here document syntax
<<< 	    Here string
EOF


ls -l > list.txt

ls -a >> list.txt

grep da * 2> errors.txt

less < errors.txt

echo "hello" > /dev/null 2>&1