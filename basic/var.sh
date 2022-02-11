#!/usr/bin/env bash

:<<EOF
There is no data type in bash. Variables in Bash can hold a number, a character, a string, and so on. At the same time, there is no need to declare variables in advance. Assigning values to variables will directly create variables.

Variable naming principle
- Naming can only use English letters, numbers and underscores. The first character cannot start with a number.
- There can be no spaces in the middle. You can use underscore (_).
- Punctuation cannot be used.
- Keywords in Bash cannot be used (you can use the help command to view reserved keywords).

Note that there must be no spaces on either side of the equal sign.
EOF

a=z                     # 变量 a 赋值为字符串 z
b="a string"            # 变量值包含空格，就必须放在引号里面
c="a string and $b"     # 变量值可以引用其他变量的值
d="\t\ta string\n"      # 变量值可以使用转义字符
e=$(ls -l foo.txt)      # 变量值可以是命令的执行结果
f=$((5 * 7))            # 变量值可以是数学运算的结果

# declare variable and output variable
word="Rekord"
echo "Hello,\"$word\""
echo "Hello,\"${word}\""

folder=$(pwd)
echo "Current folder is ${folder}"

# 如果变量的值本身也是变量，可以使用${!varname}的语法，读取最终的值。
myvar=USER
echo ${!myvar}

# readonly variable
readonly readonlyword="ReadOnlyRekord"
echo "Hello,\"$readonlyword\""
# readonlyword="ReadOnlyOkd"

# delete variable(can't delete readonly variable)
unset word
echo $word
# unset readonlyword

# let
let foo=5+5
echo $foo

let "foo = 5 + 5"

:<<EOF
Variable type
Local variables - local variables are variables that are valid only within a script. They cannot be accessed by other programs and scripts.
Environment variables - environment variables are variables that are visible to all programs or scripts in the current shell session. Creating them is similar to creating local variables, but the export keyword is used, and shell scripts can also define environment variables.

Common environment variables:
variable 	 describe
$HOME 	 User directory of the current user
$PATH 	 A semicolon delimited list of directories where the shell looks for commands
$SHELL   The name of current shell
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
echo ""
printenv BASHOPTS
printenv BASHPID
printenv SHELL
echo ""

# print all environment variables
env
printenv

# print all variables and bash function
# set

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


:<<EOF
The variables created by the user can only be used for the current shell. 
By default, the child shell cannot read the variables defined by the parent shell. 
In order to pass the variable to the sub shell, you need to use the export command. 
The variables output in this way are environment variables for the sub shell.

If the child shell modifies the inherited variable, it will not affect the parent shell.
EOF
export foo=bar


:<<EOF
Function processing parameters
In addition, there are several special characters for processing parameters:
Parameter processing 	 explain
$# 	 Return the number of parameters
$* 	 Return all parameters
$$ 	 The ID number of the current process that the script is running
$! 	 ID number of the last process running in the background
$@ 	 Return all parameters
$- 	 Returns the current option used by the shell, which has the same function as the set command.
$? 	 Function return value
$_ 	 The last parameter of previous command
$0   The name of the current shell
EOF


:<<EOF
Bash 提供四个特殊语法，跟变量的默认值有关，目的是保证变量不为空。

${varname:-word}
上面语法的含义是，如果变量varname存在且不为空，则返回它的值，否则返回word。它的目的是返回一个默认值，比如${count:-0}表示变量count不存在时返回0。

${varname:=word}
上面语法的含义是，如果变量varname存在且不为空，则返回它的值，否则将它设为word，并且返回word。它的目的是设置变量的默认值，比如${count:=0}表示变量count不存在时返回0，且将count设为0。

${varname:+word}
上面语法的含义是，如果变量名存在且不为空，则返回word，否则返回空值。它的目的是测试变量是否存在，比如${count:+1}表示变量count存在时返回1（表示true），否则返回空值。

${varname:?message}
上面语法的含义是，如果变量varname存在且不为空，则返回它的值，否则打印出varname: message，并中断脚本的执行。如果省略了message，则输出默认的信息“parameter null or not set.”。它的目的是防止变量未定义，比如${count:?"undefined!"}表示变量count未定义时就中断执行，抛出错误，返回给定的报错信息undefined!。
EOF




:<<EOF
exit | ctrl + D  	:exit shell
bash --version
echo $BASH_VERSION
EOF