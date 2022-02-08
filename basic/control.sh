#!/usr/bin/env bash

:<<EOF
Conditional statement
Like other programming languages, conditional statements in Bash allow us to decide whether an operation is executed. The result depends on an expression wrapped in [[]].
Expressions wrapped by [[]] (in SH, []) are called detection commands or primitives. These expressions help us detect the result of a condition.
There are two different conditional expressions: if and case.
EOF

# single line
if [[ 1 -eq 1 ]]; then echo "1 -eq 1 result is: true"; fi

# double line
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

for i in {1..5}; do echo $i; done

for (( i = 0; i < 10; i++ )); do
  echo $i
done

DIR=/home/rekord
for FILE in ${DIR}/*.sh; do
  mv "$FILE" "${DIR}/scripts"
done

for (( i = 0; i < 10; i ++ )); do
  if [[ $((i % 2)) -eq 0 ]]; then
    continue;
  fi
  echo ${i}
done

x=0
while [[ ${x} -lt 10 ]]; do
  echo $((x * x))
  x=$((x + 1))
done

i=1
while [[ ${i} -lt 10 ]]; do
  if [[ $((i % 3)) -eq 0 ]] && [[ $((i % 2)) -eq 0 ]]; then
    echo ${i}
    break;
  fi
  i=`expr ${i} + 1`
done


x=0
until [[ ${x} -ge 5 ]]; do
  echo ${x}
  x=`expr ${x} + 1`
done

PS3="Choose the package manager: "
select ITEM in bower npm gem pip
do
echo -n "Enter the package name: " && read PACKAGE
case ${ITEM} in
  bower) bower install ${PACKAGE} ;;
  npm) npm install ${PACKAGE} ;;
  gem) gem install ${PACKAGE} ;;
  pip) pip install ${PACKAGE} ;;
esac
break # 避免无限循环
done