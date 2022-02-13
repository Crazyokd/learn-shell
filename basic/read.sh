#!/usr/bin/env bash
echo -n "输入一些文本 > "
read text
echo "你的输入：$text"

echo Please, enter your firstname and lastname
read FN LN
echo "Hi! $LN, $FN !"


:<<EOF
如果用户的输入项少于read命令给出的变量数目，那么额外的变量值为空。
如果用户的输入项多于定义的变量，那么多余的输入项会包含到最后一个变量中。
EOF

# 如果read命令之后没有定义变量名，那么环境变量REPLY会包含所有的输入。
echo -n "Enter one or more values > "
read
echo "You entered: $REPLY"

# read命令可以用来读取文件。
filename='/etc/hosts'

while read myline
do
  echo "$myline"
done < $filename


:<<EOF
read命令读取的值，默认是以空格分隔。
可以通过自定义环境变量IFS（内部字段分隔符，Internal Field Separator 的缩写），修改分隔标志。
IFS的默认值是空格、Tab 符号、换行符号，通常取第一个（即空格）。

如果把IFS定义成冒号（:）或分号（;），就可以分隔以这两个符号分隔的值，这对读取文件很有用。
EOF

FILE=/etc/passwd

read -p "Enter a username > " user_name
file_info="$(grep "^$user_name:" $FILE)"

if [ -n "$file_info" ]; then
  IFS=":" read user pw uid gid name home shell <<< "$file_info" # IFS的赋值命令和read命令写在一行，这样的话，IFS的改变仅对后面的命令生效，该命令执行后IFS会自动恢复原来的值。
  echo "User = '$user'"
  echo "UID = '$uid'"
  echo "GID = '$gid'"
  echo "Full Name = '$name'"
  echo "Home Dir. = '$home'"
  echo "Shell = '$shell'"
else
  echo "No such user '$user_name'" >&2
  exit 1
fi

# 如果IFS设为空字符串，就等同于将整行读入一个变量。
input="/path/to/txt/file"
while IFS= read -r line
do
  echo "$line"
done < "$input"
