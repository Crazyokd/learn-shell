#!/usr/bin/env bash

:<<EOF
Conditional statement
Like other programming languages, conditional statements in Bash allow us to decide whether an operation is executed. The result depends on an expression wrapped in [[]].
Expressions wrapped by [[]] (in SH, []) are called detection commands or primitives. These expressions help us detect the result of a condition.
There are two different conditional expressions: if and case.

if后面可以跟任意数量的命令。
这时，所有命令都会执行，但是判断真伪只看最后一个命令，即使前面所有命令都失败，只要最后一个命令返回0，就会执行then的部分。

if commands; then
  commands
[elif commands; then
  commands...]
[else
  commands]
fi

or

if commands
then
  commands
[elif commands
then
  commands...]
[else
  commands]
fi
EOF

# single line
if [[ 1 -eq 1 ]]; then echo "1 -eq 1 result is: true"; fi

# multi line
if [[ "abc" -eq "abc" ]]; then
  echo ""abc" -eq "abc" result is: true"
fi

if [[ "abc" -eq "abc" ]]
then
  echo ""abc" -eq "abc" result is: true"
fi

# if-else
if [[ 2 -ne 1 ]]; then
  echo "true"
else
  echo "false"
fi

# if-elif-else
x=10
y=20
if [[ ${x} > ${y} ]]; then
   echo "${x} > ${y}"
elif [[ ${x} < ${y} ]]; then
   echo "${x} < ${y}"
else
   echo "${x} = ${y}"
fi



:<<EOF
case结构用于多值判断，可以为每个值指定对应的命令，跟包含多个elif的if结构等价，但是语义更好。它的语法如下。

case expression in
  pattern )
    commands ;;
  pattern )
    commands ;;
  ...
esac

case的匹配模式可以使用各种通配符，下面是一些例子。

a)：匹配a。
a|b)：匹配a或b。
[[:alpha:]])：匹配单个字母。
???)：匹配3个字符的单词。
*.txt)：匹配.txt结尾。
*)：匹配任意输入，通过作为case结构的最后一个模式。
EOF

oper=%
case ${oper} in
  "+")
    val=`expr ${x} + ${y}`
    echo "${x} + ${y} = ${val}"
  ;;
  "-")
    val=`expr ${x} - ${y}`
    echo "${x} - ${y} = ${val}"
  ;;
  "*")
    val=`expr ${x} \* ${y}`
    echo "${x} * ${y} = ${val}"
  ;;
  "/")
    val=`expr ${x} / ${y}`
    echo "${x} / ${y} = ${val}"
  ;;
  "%" | "mod")
    val=`expr ${x} % ${y}`
    echo "${x} % ${y} = ${val}"
  ;;
  *)
    echo "Unknown oper!"
  ;;
esac

# test globbing
echo -n "输入一个字母或数字 > "
read character
case $character in
  [[:lower:]] | [[:upper:]] ) echo "输入了字母 $character"
                              ;;
  [0-9] )                     echo "输入了数字 $character"
                              ;;
  * )                         echo "输入不符合要求"
esac

read -n 1 -p "Type a character > "
echo
case $REPLY in
  [[:upper:]])    echo "'$REPLY' is upper case." ;;&
  [[:lower:]])    echo "'$REPLY' is lower case." ;;&
  [[:alpha:]])    echo "'$REPLY' is alphabetic." ;;&
  [[:digit:]])    echo "'$REPLY' is a digit." ;;&
  [[:graph:]])    echo "'$REPLY' is a visible character." ;;&
  [[:punct:]])    echo "'$REPLY' is a punctuation symbol." ;;&
  [[:space:]])    echo "'$REPLY' is a whitespace character." ;;&
  [[:xdigit:]])   echo "'$REPLY' is a hexadecimal digit." ;;&
esac