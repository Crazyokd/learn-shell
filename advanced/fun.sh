#!/usr/bin/env bash

:<<EOF
When defining a function, the function keyword is optional.
Return returns the function return value. The return value type can only be an integer (0-255). If you do not add a return statement, the shell will take the result of the last command as the return value of the function by default.
The return value of the function is passed through $? To get it.
All functions must be defined before use. This means that the function must be placed at the beginning of the script until it is first discovered by the shell interpreter. The calling function can only use its function name.
EOF


calc(){
  PS3="choose the oper: "
  select oper in + - \* / # 生成操作符选择菜单
  do
  echo -n "enter first num: " && read x # 读取输入参数
  echo -n "enter second num: " && read y # 读取输入参数
  exec
  case ${oper} in
    "+")
      return $((${x} + ${y}))
    ;;
    "-")
      return $((${x} - ${y}))
    ;;
    "*")
      return $((${x} * ${y}))
    ;;
    "/")
      return $((${x} / ${y}))
    ;;
    *)
      echo "${oper} is not support!"
      return 0
    ;;
  esac
  break
  done
}
# calc
echo "the result is: $?" # $? get the return value of the calc function


:<<EOF
Positional parameters are variables created when a function is called and arguments are passed to it.
Position parameter variable table:
variable 	 describe
$0 	 Script name
$1 … $9 	 1st to 9th parameter list
${10} … ${N} 	 10th to nth parameter list
$* or $@ 	 All location parameters except $0
$# 	 Number of location parameters excluding $0
$FUNCNAME 	 Function name (only values inside the function)
EOF


x=0
if [[ -n $1 ]]; then
  echo "第一个参数为：$1"
  x=$1
else
  echo "第一个参数为空"
fi

y=0
if [[ -n $2 ]]; then # test if the variable is not empty.more detail see ope.sh
  echo "第二个参数为：$2"
  y=$2
else
  echo "第二个参数为空"
fi

paramsFunction(){
  echo "函数第一个入参：$1"
  echo "函数第二个入参：$2"
}
paramsFunction ${x} ${y}


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
EOF


runner() {
  return 0
}

name=Rekord
paramsFunction(){
  echo "函数第一个入参：$1"
  echo "函数第二个入参：$2"
  echo "传递到脚本的参数个数：$#"
  echo "所有参数："
  printf "+ %s\n" "$*"
  echo "脚本运行的当前进程 ID 号：$$"
  echo "后台运行的最后一个进程的 ID 号：$!"
  echo "所有参数："
  printf "+ %s\n" "$@"
  echo "Shell 使用的当前选项：$-"
  runner
  echo "runner 函数的返回值：$?"
}
paramsFunction 1 "abc" "hello, \"Rekord\""


:<<EOF
shift命令可以改变脚本参数，每次执行都会移除脚本当前的第一个参数（$1），使得后面的参数向前一位，即$2变成$1、$3变成$2、$4变成$3，以此类推。
EOF

while getopts 'lha:' OPTION; do
  case "$OPTION" in
    l)
      echo "linuxconfig"
      ;;

    h)
      echo "h stands for h"
      ;;

    a)
      avalue="$OPTARG"
      echo "The value provided is $OPTARG"
      ;;
    ?)
      echo "script usage: $(basename $0) [-l] [-h] [-a somevalue]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND - 1))"

:<<EOF
上面例子中，while循环不断执行getopts 'lha:' OPTION命令，每次执行就会读取一个连词线参数（以及对应的参数值），然后进入循环体。变量OPTION保存的是，当前处理的那一个连词线参数（即l、h或a）。如果用户输入了没有指定的参数（比如-x），那么OPTION等于?。循环体内使用case判断，处理这四种不同的情况。

如果某个连词线参数带有参数值，比如-a foo，那么处理a参数的时候，环境变量$OPTARG保存的就是参数值。

注意，只要遇到不带连词线的参数，getopts就会执行失败，从而退出while循环。比如，getopts可以解析command -l foo，但不可以解析command foo -l。另外，多个连词线参数写在一起的形式，比如command -lh，getopts也可以正确处理。

变量$OPTIND在getopts开始执行前是1，然后每次执行就会加1。等到退出while循环，就意味着连词线参数全部处理完毕。这时，$OPTIND - 1就是已经处理的连词线参数个数，使用shift命令将这些参数移除，保证后面的代码可以用$1、$2等处理命令的主参数。
EOF


# 配置项参数终止符 -- 


:<<EOF
source命令用于执行一个脚本，通常用于重新加载一个配置文件。
source命令最大的特点是在当前 Shell 执行脚本，不像直接执行脚本时，会新建一个子 Shell。
所以，source命令执行脚本时，不需要export变量。
source有一个简写形式，可以使用一个点（.）来表示。
EOF


:<<EOF
alias # 显示所有别名
alias name=definition
unalias name  # 删除别名
EOF