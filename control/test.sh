#!/usr/bin/env bash
:<<EOF
if结构的判断条件，一般使用test命令，有三种形式。

# 写法一
test expression

# 写法二
[ expression ]

# 写法三,支持正则判断
[[ expression ]]
EOF


:<<EOF
:<<EOF
以下表达式用来判断文件状态。

[ -a file ]：如果 file 存在，则为true。
[ -b file ]：如果 file 存在并且是一个块（设备）文件，则为true。
[ -c file ]：如果 file 存在并且是一个字符（设备）文件，则为true。
[ -d file ]：如果 file 存在并且是一个目录，则为true。
[ -e file ]：如果 file 存在，则为true。
[ -f file ]：如果 file 存在并且是一个普通文件，则为true。
[ -g file ]：如果 file 存在并且设置了组 ID，则为true。
[ -G file ]：如果 file 存在并且属于有效的组 ID，则为true。
[ -h file ]：如果 file 存在并且是符号链接，则为true。
[ -k file ]：如果 file 存在并且设置了它的“sticky bit”，则为true。
[ -L file ]：如果 file 存在并且是一个符号链接，则为true。
[ -N file ]：如果 file 存在并且自上次读取后已被修改，则为true。
[ -O file ]：如果 file 存在并且属于有效的用户 ID，则为true。
[ -p file ]：如果 file 存在并且是一个命名管道，则为true。
[ -r file ]：如果 file 存在并且可读（当前用户有可读权限），则为true。
[ -s file ]：如果 file 存在且其长度大于零，则为true。
[ -S file ]：如果 file 存在且是一个网络 socket，则为true。
[ -t fd ]：如果 fd 是一个文件描述符，并且重定向到终端，则为true。 这可以用来判断是否重定向了标准输入／输出／错误。
[ -u file ]：如果 file 存在并且设置了 setuid 位，则为true。
[ -w file ]：如果 file 存在并且可写（当前用户拥有可写权限），则为true。
[ -x file ]：如果 file 存在并且可执行（有效用户有执行／搜索权限），则为true。
[ file1 -nt file2 ]：如果 FILE1 比 FILE2 的更新时间最近，或者 FILE1 存在而 FILE2 不存在，则为true。
[ file1 -ot file2 ]：如果 FILE1 比 FILE2 的更新时间更旧，或者 FILE2 存在而 FILE1 不存在，则为true。
[ FILE1 -ef FILE2 ]：如果 FILE1 和 FILE2 引用相同的设备和 inode 编号，则为true。
EOF


file="/etc/hosts"

if [[ -r ${file} ]]; then
   echo "${file} 文件可读"
else
   echo "${file} 文件不可读"
fi
if [[ -w ${file} ]]; then
   echo "${file} 文件可写"
else
   echo "${file} 文件不可写"
fi
if [[ -x ${file} ]]; then
   echo "${file} 文件可执行"
else
   echo "${file} 文件不可执行"
fi
if [[ -f ${file} ]]; then
   echo "${file} 文件为普通文件"
else
   echo "${file} 文件为特殊文件"
fi
if [[ -d ${file} ]]; then
   echo "${file} 文件是个目录"
else
   echo "${file} 文件不是个目录"
fi
if [[ -s ${file} ]]; then
   echo "${file} 文件不为空"
else
   echo "${file} 文件为空"
fi
if [[ -e ${file} ]]; then
   echo "${file} 文件存在"
else
   echo "${file} 文件不存在"
fi


FILE=~/.bashrc

if [ -e "$FILE" ]; then
  if [ -f "$FILE" ]; then
    echo "$FILE is a regular file."
  fi
  if [ -d "$FILE" ]; then
    echo "$FILE is a directory."
  fi
  if [ -r "$FILE" ]; then
    echo "$FILE is readable."
  fi
  if [ -w "$FILE" ]; then
    echo "$FILE is writable."
  fi
  if [ -x "$FILE" ]; then
    echo "$FILE is executable/searchable."
  fi
else
  echo "$FILE does not exist"
  exit 1
fi


:<<EOF
以下表达式用来判断字符串。

[ string ]：如果string不为空（长度大于0），则判断为真。
[ -n string ]：如果字符串string的长度大于零，则判断为真。
[ -z string ]：如果字符串string的长度为零，则判断为真。
[ string1 = string2 ]：如果string1和string2相同，则判断为真。
[ string1 == string2 ] 等同于[ string1 = string2 ]。
[ string1 != string2 ]：如果string1和string2不相同，则判断为真。
[ string1 '>' string2 ]：如果按照字典顺序string1排列在string2之后，则判断为真。
[ string1 '<' string2 ]：如果按照字典顺序string1排列在string2之前，则判断为真。
注意，test命令内部的>和<，必须用引号引起来（或者是用反斜杠转义）。否则，它们会被 shell 解释为重定向操作符。
EOF

ANSWER=maybe

if [ -z "$ANSWER" ]; then
  echo "There is no answer." >&2
  exit 1
fi
if [ "$ANSWER" = "yes" ]; then
  echo "The answer is YES."
elif [ "$ANSWER" = "no" ]; then
  echo "The answer is NO."
elif [ "$ANSWER" = "maybe" ]; then
  echo "The answer is MAYBE."
else
  echo "The answer is UNKNOWN."
fi


:<<EOF
下面的表达式用于判断整数。

[ integer1 -eq integer2 ]：如果integer1等于integer2，则为true。
[ integer1 -ne integer2 ]：如果integer1不等于integer2，则为true。
[ integer1 -le integer2 ]：如果integer1小于或等于integer2，则为true。
[ integer1 -lt integer2 ]：如果integer1小于integer2，则为true。
[ integer1 -ge integer2 ]：如果integer1大于或等于integer2，则为true。
[ integer1 -gt integer2 ]：如果integer1大于integer2，则为true。
EOF

INT=-5

if [ -z "$INT" ]; then
  echo "INT is empty." >&2
  exit 1
fi
if [ $INT -eq 0 ]; then
  echo "INT is zero."
else
  if [ $INT -lt 0 ]; then
    echo "INT is negative."
  else
    echo "INT is positive."
  fi
  if [ $((INT % 2)) -eq 0 ]; then
    echo "INT is even."
  else
    echo "INT is odd."
  fi
fi


:<<EOF
[[ expression ]]这种判断形式，支持正则表达式。

[[ string1 =~ regex ]]
EOF

INT=-5

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  echo "INT is an integer."
  exit 0
else
  echo "INT is not an integer." >&2
  exit 1
fi


:<<EOF
通过逻辑运算，可以把多个test判断表达式结合起来，创造更复杂的判断。三种逻辑运算AND，OR，和NOT，都有自己的专用符号。

AND运算：符号&&，也可使用参数-a。
OR运算：符号||，也可使用参数-o。
NOT运算：符号!。
EOF

MIN_VAL=1
MAX_VAL=100

INT=50

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  if [[ $INT -ge $MIN_VAL && $INT -le $MAX_VAL ]]; then
    echo "$INT is within $MIN_VAL to $MAX_VAL."
  else
    echo "$INT is out of range."
  fi
else
  echo "INT is not an integer." >&2
  exit 1
fi

if [ ! \( $INT -ge $MIN_VAL -a $INT -le $MAX_VAL \) ]; then
    echo "$INT is outside $MIN_VAL to $MAX_VAL."
else
    echo "$INT is in range."
fi


:<<EOF
Bash 还提供了((...))作为算术条件，进行算术运算的判断。

if ((3 > 2)); then
  echo "true"
fi
EOF

INT=-5

if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
  if ((INT == 0)); then
    echo "INT is zero."
  else
    if ((INT < 0)); then
      echo "INT is negative."
    else
      echo "INT is positive."
    fi
    if (( ((INT % 2)) == 0)); then
      echo "INT is even."
    else
      echo "INT is odd."
    fi
  fi
else
  echo "INT is not an integer." >&2
  exit 1
fi


:<<EOF
如果if结构使用的不是test命令，而是普通命令，比如上一节的((...))算术运算，或者test命令与普通命令混用，那么可以使用 Bash 的命令控制操作符&&（AND）和||（OR），进行多个命令的逻辑运算。

$ command1 && command2
$ command1 || command2
对于&&操作符，先执行command1，只有command1执行成功后， 才会执行command2。对于||操作符，先执行command1，只有command1执行失败后， 才会执行command2。
EOF