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
calc
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