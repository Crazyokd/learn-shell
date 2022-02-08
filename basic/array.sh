#!/usr/bin/env bash

:<<EOF
Bash only supports one-dimensional arrays.
The array subscript starts from 0. The subscript can be an integer or arithmetic expression, and its value should be greater than or equal to 0.
EOF

# create array
nums=([2]=2 [0]=0 [1]=1)
colors=(red yellow "dark blue")

# visit single element
echo ${nums[1]}
# visit all elements
echo ${colors[*]}
echo ${colors[@]} # recommended
printf "+ %s\n" ${colors[*]}
printf "+ %s\n" "${colors[*]}"
printf "+ %s\n" "${colors[@]}"
# visit part of elements
echo ${nums[@]:0:2}

# get length of array
echo ${#nums[*]}

# add element to array
colors=(white "${colors[@]}" green black)
echo ${colors[@]}

# delete element from array
unset nums[0]
echo ${nums[@]}