#!/usr/bin/env bash

:<<EOF
There is no data type in bash. Variables in Bash can hold a number, a character, a string, and so on. At the same time, there is no need to declare variables in advance. Assigning values to variables will directly create variables.

Variable naming principle
- Naming can only use English letters, numbers and underscores. The first character cannot start with a number.
- There can be no spaces in the middle. You can use underscore (_).
- Punctuation cannot be used.
- Keywords in Bash cannot be used (you can use the help command to view reserved keywords).
EOF

# declare variable and output variable
word="Rekord"
echo "Hello,\"$word\""
echo "Hello,\"${word}\""

folder=$(pwd)
echo "Current folder is ${folder}"

# readonly variable
readonly readonlyword="ReadOnlyRekord"
echo "Hello,\"$readonlyword\""
# readonlyword="ReadOnlyOkd"

# delete variable(can't delete readonly variable)
unset word
echo $word
# unset readonlyword


:<<EOF
Variable type
Local variables - local variables are variables that are valid only within a script. They cannot be accessed by other programs and scripts.
Environment variables - environment variables are variables that are visible to all programs or scripts in the current shell session. Creating them is similar to creating local variables, but the export keyword is used, and shell scripts can also define environment variables.

Common environment variables:
variable 	 describe
$HOME 	 User directory of the current user
$PATH 	 A semicolon delimited list of directories where the shell looks for commands
$PWD 	 Current working directory
$RANDOM 	 Integer between 0 and 32767
$UID 	 Value type, user ID of current user
$PS1 	 Main system input prompt
$PS2 	 Secondary system input prompt
EOF

# system variables
echo "UID:$UID"
echo LOGNAME:$LOGNAME
echo User:$USER
echo HOME:$HOME
echo PATH:$PATH
echo HOSTNAME:$HOSTNAME
echo SHELL:$SHELL
echo LANG:$LANG

# user varibles
days=10
user="admin"
echo "$user logged in $days days age"
days=5
user="root"
echo "$user logged in $days days age"


# join variable
colors="Red Yellow Blue"
colors=$colors" White Black"

for color in $colors
do
	echo "$color"
done