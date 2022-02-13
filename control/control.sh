#!/usr/bin/env bash

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