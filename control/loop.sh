#!/usr/bin/env bash

:<<EOF
for...in循环用于遍历列表的每一项。

for variable in list
do
  commands
done
上面语法中，for循环会依次从list列表中取出一项，作为变量variable，然后在循环体中进行处理。

关键词do可以跟for写在同一行，两者使用分号分隔。
for variable in list; do
  commands
done

列表可以由通配符产生。

for i in *.png; do
  ls -l $i
done
EOF

for i in {1..5}; do echo $i; done

for (( i = 0; i < 10; i++ )); do
  echo $i
done

DIR=/home/rekord
for FILE in ${DIR}/*.sh; do
  mv "$FILE" "${DIR}/scripts"
done


:<<EOF
for循环还支持 C 语言的循环语法。

for (( expression1; expression2; expression3 )); do
  commands
done
上面代码中，expression1用来初始化循环条件，expression2用来决定循环结束的条件，expression3在每次循环迭代的末尾执行，用于更新值。

注意，循环条件放在双重圆括号之中。另外，圆括号之中使用变量，不必加上美元符号$。
EOF

for (( i = 0; i < 10; i ++ )); do
  if [[ $((i % 2)) -eq 0 ]]; then
    continue;
  fi
  echo ${i}
done

:<<EOF
while循环有一个判断条件，只要符合条件，就不断循环执行指定的语句。

while condition; do
  commands
done
上面代码中，只要满足条件condition，就会执行命令commands。
然后，再次判断是否满足条件condition，只要满足，就会一直执行下去。只有不满足条件，才会退出循环。
EOF
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


:<<EOF
until循环与while循环恰好相反，只要不符合判断条件（判断条件失败），就不断循环执行指定的语句。一旦符合判断条件，就退出循环。

until condition; do
  commands
done
关键字do可以与until不写在同一行，这时两者之间不需要分号分隔。
EOF

x=0
until [[ ${x} -ge 5 ]]; do
  echo ${x}
  x=`expr ${x} + 1`
done


:<<EOF
select结构主要用来生成简单的菜单。它的语法与for...in循环基本一致。

select name
[in list]
do
  commands
done
Bash 会对select依次进行下面的处理。

select生成一个菜单，内容是列表list的每一项，并且每一项前面还有一个数字编号。
Bash 提示用户选择一项，输入它的编号。
用户输入以后，Bash 会将该项的内容存在变量name，该项的编号存入环境变量REPLY。如果用户没有输入，就按回车键，Bash 会重新输出菜单，让用户选择。
执行命令体commands。
执行结束后，回到第一步，重复这个过程。
EOF

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