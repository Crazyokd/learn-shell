#!/usr/bin/env bash

:<<EOF
Arithmetic operator
The following table lists the commonly used arithmetic operators, assuming that variable x is 10 and variable y is 20:
operator 	 explain 	 give an example
+ 	 addition 	 Expr $X + $y results in 30.
- 	 subtraction 	 Expr $X - $y results in - 10.
* 	 multiplication 	 Expr $X * $y results in 200.
/ 	 division 	 Expr $Y / $X results in 2.
% 	 Surplus 	 Expr $y% $X results in 0.
= 	 assignment 	 X = $y assigns the value of variable y to X.
== 	 equal. Used to compare two numbers and return true if they are the same. 	 [$x = = $y] returns false.
!= 	 Unequal. It is used to compare two numbers. If they are different, it returns true. 	 [$X! = $y] returns true.

**Note: * * conditional expressions should be placed between square brackets with spaces. For example: [$x = = $y] is wrong and must be written as [$x = = $y].
EOF


x=10
y=20

echo "x=${x}, y=${y}"

val=`expr ${x} + ${y}`
echo "${x} + ${y} = $val"

val=`expr ${x} - ${y}`
echo "${x} - ${y} = $val"

val=`expr ${x} \* ${y}`
echo "${x} * ${y} = $val"

val=`expr ${y} / ${x}`
echo "${y} / ${x} = $val"

val=`expr ${y} % ${x}`
echo "${y} % ${x} = $val"

if [[ ${x} == ${y} ]]
then
  echo "${x} = ${y}"
fi
if [[ ${x} != ${y} ]]
then
  echo "${x} != ${y}"
fi


:<<EOF
Relational operator
Relational operators only support numbers, not strings, unless the value of the string is a number.
The following table lists the common relational operators, assuming that variable x is 10 and variable y is 20:
operator 	 explain 	 give an example
-eq 	 Check whether the two numbers are equal, and return true if they are equal. 	 [$a - EQ $b] returns false.
-ne 	 Check whether the two numbers are equal. If they are not equal, return true. 	 [$a - Ne $b] returns true.
-gt 	 Check whether the number on the left is greater than that on the right. If so, return true. 	 [$a - GT $b] returns false.
-lt 	 Check whether the number on the left is less than that on the right. If so, return true. 	 [$a - LT $b] returns true.
-ge 	 Check whether the number on the left is greater than or equal to that on the right. If so, return true. 	 [$a - Ge $b] returns false.
-le 	 Check whether the number on the left is less than or equal to that on the right. If so, return true. 	 [$a - Le $b] returns true.
EOF


if [[ ${x} -eq ${y} ]]; then
   echo "${x} -eq ${y} : x 等于 y"
else
   echo "${x} -eq ${y}: x 不等于 y"
fi

if [[ ${x} -ne ${y} ]]; then
   echo "${x} -ne ${y}: x 不等于 y"
else
   echo "${x} -ne ${y}: x 等于 y"
fi

if [[ ${x} -gt ${y} ]]; then
   echo "${x} -gt ${y}: x 大于 y"
else
   echo "${x} -gt ${y}: x 不大于 y"
fi

if [[ ${x} -lt ${y} ]]; then
   echo "${x} -lt ${y}: x 小于 y"
else
   echo "${x} -lt ${y}: x 不小于 y"
fi

if [[ ${x} -ge ${y} ]]; then
   echo "${x} -ge ${y}: x 大于或等于 y"
else
   echo "${x} -ge ${y}: x 小于 y"
fi

if [[ ${x} -le ${y} ]]; then
   echo "${x} -le ${y}: x 小于或等于 y"
else
   echo "${x} -le ${y}: x 大于 y"
fi


:<<EOF
Boolean operator
The following table lists the common Boolean operators, assuming that variable x is 10 and variable y is 20:
operator 	 explain 	 give an example
! 	 If the expression is true, it returns false; otherwise, it returns true. 	 [! False] returns true.
-o 	 Or operation. If an expression is true, it returns true. 	 [$a - LT 20 - o $B - GT 100] returns true.
-a 	 And operation, both expressions return true only when they are true. 	 [$a - LT 20 - a $B - GT 100] returns false.

Logical operator
The following describes the logical operators of shell, assuming that variable x is 10 and variable y is 20:
operator 	 explain 	 give an example
&& 	 Logical and 	 [[${x} - LT 100 && ${y} - GT 100]] returns false
||   Logical or 	 [[${x} - LT 100 || ${y} - GT 100]] returns true
EOF


if [[ ${x} -lt 100 && ${y} -gt 15 ]]; then
   echo "${x} 小于 100 且 ${y} 大于 15 : 返回 true"
else
   echo "${x} 小于 100 且 ${y} 大于 15 : 返回 false"
fi

if [[ ${x} -lt 100 || ${y} -gt 100 ]]; then
   echo "${x} 小于 100 或 ${y} 大于 100 : 返回 true"
else
   echo "${x} 小于 100 或 ${y} 大于 100 : 返回 false"
fi

if [[ ${x} -lt 5 || ${y} -gt 100 ]]; then
   echo "${x} 小于 5 或 ${y} 大于 100 : 返回 true"
else
   echo "${x} 小于 5 或 ${y} 大于 100 : 返回 false"
fi


:<<EOF
String operator
The following table assumes that the common variable a is "efg" and the common variable b is "abc":
operator 	 explain 	 give an example
= 	 Check whether two strings are equal, and return true if they are equal. 	 [$a = $b] returns false.
!= 	 Check whether two strings are equal. If not, return true. 	 [$a! = $b] returns true.
-z 	 Check whether the string length is 0, and return true if it is 0. 	 [- Z $a] returns false.
-n 	 Check whether the string length is 0. If not, return true. 	 [- true] returns $n.
str 	 Check whether the string is empty. If not, return true. 	 [$a] returns true.
EOF


x="abc"
y="xyz"


echo "x=${x}, y=${y}"

if [[ ${x} = ${y} ]]; then
   echo "${x} = ${y} : x 等于 y"
else
   echo "${x} = ${y}: x 不等于 y"
fi

if [[ ${x} != ${y} ]]; then
   echo "${x} != ${y} : x 不等于 y"
else
   echo "${x} != ${y}: x 等于 y"
fi

if [[ -z ${x} ]]; then
   echo "-z ${x} : 字符串长度为 0"
else
   echo "-z ${x} : 字符串长度不为 0"
fi

if [[ -n "${x}" ]]; then
   echo "-n ${x} : 字符串长度不为 0"
else
   echo "-n ${x} : 字符串长度为 0"
fi

if [[ ${x} ]]; then
   echo "${x} : 字符串不为空"
else
   echo "${x} : 字符串为空"
fi