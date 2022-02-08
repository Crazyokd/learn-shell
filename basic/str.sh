#!usr/bin/env bash

:<<EOF
Single and double quotation marks
Shell strings can use single quotation marks', double quotation marks", or no quotation marks.

Characteristics of single quotation marks
Variables are not recognized in single quotation marks
Single quotation marks cannot appear in single quotation marks (nor can they be used with escape characters), but they can appear in pairs and be used as string splicing.

Characteristics of double quotation marks
Identify variables in double quotation marks
Escape characters can appear in double quotation marks

To sum up, double quotation marks are recommended.
EOF

# Use single quotation mark splicing
name1='white'
str1='hello, ${name1}'
str2='hello, ${name1}'
echo ${str1}_${str2}

# Use double quotation mark splicing
name2="black"
str3="hello, "${name2}""
str4="hello, ${name2}"
echo ${str3}_${str4}

# get the length of string
text="12345"
echo ${#text}

# intercept string
echo ${text:1:2}

full_branch="feature/1.0.0"
branch=`echo ${full_branch#feature/}`
echo "branch is ${branch}"

full_version="0.0.1-SNAPSHOT"
version=`echo ${full_version%-SNAPSHOT}`
echo "version is ${version}"

# find sub string
text="hello"
echo `expr index "${text}" ll`

# whether string contains
str=feature/test
result=$(echo "${str}" | grep "feature/")
echo ${result}
if [[ "$result" != "" ]]; then
	echo "feature/ 是 ${str} 的子字符串"
else
	echo "feature/ 不是 ${str} 的子字符串"
fi

# split string into arrays
str="0.0.0.1"
OLD_IFS="$IFS"
IFS="."
array=( ${str} )
IFS="$OLD_IFS"
size=${#array[*]}
lastIndex=`expr ${size} - 1`
echo "数组长度：${size}"
echo "最后一个数组元素：${array[${lastIndex}]}"
for item in ${array[@]}
do
	echo "$item"
done

# whether string is empty

#-n whether the length of string is not zero
#-z whether the length of string is zero

str=testing
str2=''
if [[ -n "$str" ]]
then
	echo "The string $str is not empty"
else
	echo "The string $str is empty"
fi

if [[ -n "$str2" ]]
then
	echo "The string $str2 is not empty"
else
	echo "The string $str2 is empty"
fi

# compare string
str=hello
str2=world
if [[ $str = "hello" ]]; then
	echo "str equals hello"
else
	echo "str not equals hello"
fi

if [[ $str2 = "hello" ]]; then
	echo "str2 equals hello"
else
	echo "str2 not equals hello"
fi