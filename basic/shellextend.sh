#!usr/bin/env bash
echo beg{i,a,u}n

echo {0..5}
echo {00..8..2}

# command displacement
now=`date +%T`
### or
now=$(date +%T)

echo $now

result=$(( ((10 + 5*3) - 7) / 2 ))
echo $result

# you needn't use $() to specify variable in arithmetic expression
x=4
y=7
echo $(( x + y ))     
echo $(( ++x + y++ )) 
echo $(( x + y ))     


INPUT="A string  with   strange    whitespace."
echo $INPUT   ### A string with strange whitespace.
echo "$INPUT" ### A string  with   strange    whitespace.

FILE="Favorite Things.txt"
cat $FILE   ### try to output double files: `Favorite` 和 `Things.txt`
cat "$FILE" ### try to output a file: `Favorite Things.txt`