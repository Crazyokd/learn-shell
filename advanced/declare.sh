#/usr/bin/env bash
:<<EOF
declare命令可以声明一些特殊类型的变量，为变量设置一些限制，比如声明只读类型的变量和整数类型的变量。

它的语法形式如下。

declare OPTION VARIABLE=value
declare命令的主要参数（OPTION）如下。

-a：声明数组变量。
-f：输出所有函数定义。
-F：输出所有函数名。
-i：声明整数变量。
-l：声明变量为小写字母。
-p：查看变量信息。
-r：声明只读变量。
-u：声明变量为大写字母。
-x：该变量输出为环境变量

declare命令如果用在函数中，声明的变量只在函数内部有效，等同于local命令。

不带任何参数时，declare命令输出当前环境的所有变量，包括函数在内，等同于不带有任何参数的set命令。
EOF


declare -i var1=12 var2=5
declare -i result
result=var1*var2
echo $result

declare -i var=12
var=foo
echo $var

# -x
declare -x var
# equal to
export var

# -r:readonly
# declare -r var=1
# var=2

# -u
declare -u bar=foo
echo $bar

# -l

# -p
foo=hello
declare -p foo

# -f
declare -f

# -F
declare -F