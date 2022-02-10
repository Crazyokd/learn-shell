#!usr/bin/env bash

:<<EOF
Shell 接收到用户输入的命令以后，会根据空格将用户的输入，拆分成一个个词元（token）。然后，Shell 会扩展词元里面的特殊字符，扩展完成后才会调用相应的命令。

这种特殊字符的扩展，称为模式扩展（globbing）。其中有些用到通配符，又称为通配符扩展（wildcard expansion）。Bash 一共提供八种扩展。

波浪线扩展
? 字符扩展
* 字符扩展
方括号扩展
大括号扩展
变量扩展
子命令扩展
算术扩展

Bash 是先进行扩展，再执行命令。因此，扩展的结果是由 Bash 负责的，与所要执行的命令无关。命令本身并不存在参数扩展，收到什么参数就原样执行。

模式扩展与正则表达式的关系是，模式扩展早于正则表达式出现，可以看作是原始的正则表达式。它的功能没有正则那么强大灵活，但是优点是简单和方便。
EOF


# close globbing
set -o noglob
# or
set -f

# open globbing
set +o noglob
# or
set +f

# The wavy line ~ will automatically expand to the home directory of the current user.
echo ~

# ~user means to expand to the home directory of user.
echo ~rekord
echo ~root
echo ~haha # invalid user,output ~ normally

# ? Characters represent any single character in the file path, excluding empty characters.
ls data???.txt
echo data?.txt

# * Characters represent any number of arbitrary characters in the file path, including zero characters.
# Note that * does not match hidden files
echo *.txt
# 如果要匹配隐藏文件，同时要排除.和..这两个特殊的隐藏文件，可以与方括号扩展结合使用，写成.[!.]*。
echo .[!.]*
# * Only the current directory will be matched, and no subdirectories will be matched.


# 括号之中的任意一个字符。比如，[aeiou]可以匹配五个元音字母中的任意一个。
echo [ab].txt
# [^...]和[!...]。它们表示匹配不在方括号里面的字符，这两种写法是等价的。

# 注意，如果需要匹配[字符，可以放在方括号内，比如[[aeiou]。如果需要匹配连字号-，只能放在方括号内部的开头或结尾，比如[-aeiou]或[aeiou-]。

# 方括号扩展有一个简写形式[start-end]，表示匹配一个连续的范围。比如，[a-c]等同于[abc]，[0-9]匹配[0123456789]。
# 这种简写形式有一个否定形式[!start-end]，表示匹配不属于这个范围的字符。比如，[!a-zA-Z]表示匹配非英文字母的字符。


# 大括号扩展{...}表示分别扩展成大括号里面的所有值，各个值之间使用逗号分隔。比如，{1,2,3}扩展成1 2 3。
# 大括号内部的逗号前后不能有空格。否则，大括号扩展会失效。
echo beg{i,a,u}n
# 逗号前面可以没有值，表示扩展的第一项为空。
echo beg{,a,u}n
# 大括号可以嵌套
echo {j{p,pe}g,png}


# 大括号扩展有一个简写形式{start..end}，表示扩展成一个连续序列。
echo {0..5}
# 支持逆序
echo {5..0}

# 整数前带有前导
echo {01..5}
echo {001..5}

# 这种简写形式还可以使用第二个双点号（start..end..step），用来指定扩展的步长。
echo {00..8..2}

# 多个简写形式连用，会有循环处理的效果。
echo {a..c}{1..3}


# command displacement
echo $(date)
echo `date`
now=`date +%T`
### or
now=$(date +%T)

echo $now

# arithmetic expansion
result=$((((10 + 5*3) - 7) / 2))
echo $result

# you needn't use $() to specify variable in arithmetic expression
x=4
y=7
echo $((x + y))     
echo $((++x + y++)) 
echo $((x + y))     


INPUT="A string  with   strange    whitespace."
echo $INPUT   ### A string with strange whitespace.
echo "$INPUT" ### A string  with   strange    whitespace.

FILE="Favorite Things.txt"
cat $FILE   ### try to output double files: `Favorite` 和 `Things.txt`
cat "$FILE" ### try to output a file: `Favorite Things.txt`


:<<EOF
[[:class:]]表示一个字符类，扩展成某一类特定字符之中的一个。常用的字符类如下。

[[:alnum:]]：匹配任意英文字母与数字
[[:alpha:]]：匹配任意英文字母
[[:blank:]]：空格和 Tab 键。
[[:cntrl:]]：ASCII 码 0-31 的不可打印字符。
[[:digit:]]：匹配任意数字 0-9。
[[:graph:]]：A-Z、a-z、0-9 和标点符号。
[[:lower:]]：匹配任意小写字母 a-z。
[[:print:]]：ASCII 码 32-127 的可打印字符。
[[:punct:]]：标点符号（除了 A-Z、a-z、0-9 的可打印字符）。
[[:space:]]：空格、Tab、LF（10）、VT（11）、FF（12）、CR（13）。
[[:upper:]]：匹配任意大写字母 A-Z。
[[:xdigit:]]：16进制字符（A-F、a-f、0-9）。
EOF


echo [[:digit:]]*
echo [![:upper:]]*


:<<EOF
?(pattern-list)：匹配零个或一个模式。
*(pattern-list)：匹配零个或多个模式。
+(pattern-list)：匹配一个或多个模式。
@(pattern-list)：只匹配一个模式。
!(pattern-list)：匹配给定模式以外的任何内容。
EOF


:<<EOF
# 打开某个参数
$ shopt -s [optionname]
# 关闭某个参数
$ shopt -u [optionname]
# 查询某个参数关闭还是打开
$ shopt [optionname]


（1）dotglob 参数
dotglob参数可以让扩展结果包括隐藏文件（即点开头的文件）。

（2）nullglob 参数=
nullglob参数可以让通配符不匹配任何文件名时，返回空字符。
默认情况下，通配符不匹配任何文件名时，会保持不变。

（3）failglob 参数
failglob参数使得通配符不匹配任何文件名时，Bash 会直接报错，而不是让各个命令去处理。

（4）extglob 参数
extglob参数使得 Bash 支持 ksh 的一些扩展语法。它默认应该是打开的。

（5）nocaseglob 参数
nocaseglob参数可以让通配符扩展不区分大小写。

（6）globstar 参数
globstar参数可以使得**匹配零个或多个子目录。该参数默认是关闭的.
EOF