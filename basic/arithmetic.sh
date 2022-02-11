#!/usr/bin/env bash

# you needn't use $() to specify variable in arithmetic expression
x=4
y=7
echo $((x + y))     
echo $((++x + y++)) 
echo $((x + y))     

((foo = 5 + 4))
echo $foo

# if the result not equals 0,represent execute success.
# note the programma only support integer arithmetic.
((5 + 4))
echo $?
((3-3))
echo $?


:<<EOF
Bash 的数值默认都是十进制，但是在算术表达式中，也可以使用其他进制。

number：没有任何特殊表示法的数字是十进制数（以10为底）。
0number：八进制数。
0xnumber：十六进制数。
base#number：base进制的数。
EOF

echo $((0xff))
echo $((2#11111111))


# bit operation
echo $((16<<2))


# logic operation
echo $((3 > 2))
echo $((3 < 2 ? 3 : 2))

# assignment operation
echo $((a = 3))
echo $a

echo $((a += 3))
echo $((a -= 3))
echo $((a *= 3))
echo $((a /= 3))
echo $((a %= 3))
# echo $((a **= 3))
echo $((a &= 3))
echo $((a |= 3))
echo $((a ^= 3))
echo $((a <<= 3))


# expr command,only support integer arithmetic.
expr 2 + 3
foo=2
expr $foo + 3

# let command 
let "a = 2 + 3"
echo $a