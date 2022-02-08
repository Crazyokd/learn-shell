#/usr/bin/env bash

# single quotation marks
printf '%d %s\n' 1 "single quotation marks"

# double quotation marks
printf "%d %s\n" 2 "double quotation marks"

# no quotation marks
printf %s "no quotation marks"

echo ""

# assign formal single argument but multi real arguments
printf "%s\n" "first real argument" "second real argument"
printf "%s %s %s\n" a b c d e f g h i j

# if no real argument, %s will be replaced by empty string and %d will be replaced by 0
printf "%s%d\n"

# format output
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876


:<<EOF
printf 的转义符
序列	说明
\a	    警告字符，通常为 ASCII 的 BEL 字符
\b	    后退
\c	    抑制（不显示）输出结果中任何结尾的换行字符（只在%b 格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
\f	    换页（formfeed）
\n	    换行
\r	    回车（Carriage return）
\t	    水平制表符
\v	    垂直制表符
\\	    一个字面上的反斜杠字符
\ddd	表示 1 到 3 位数八进制值的字符。仅在格式字符串中有效
\0ddd	表示 1 到 3 位的八进制值字符
EOF