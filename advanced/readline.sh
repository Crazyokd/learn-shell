#!/usr/bin/env bash

# modify default editor emacs to vi
set -o vi


:<<EOF
Readline 提供快速移动光标的快捷键。

Ctrl + a：移到行首。
Ctrl + b：向行首移动一个字符，与左箭头作用相同。
Ctrl + e：移到行尾。
Ctrl + f：向行尾移动一个字符，与右箭头作用相同。
Alt + f：移动到当前单词的词尾。
Alt + b：移动到当前单词的词首。
上面快捷键的 Alt 键，也可以用 ESC 键代替。

Ctrl + l：清屏。

下面的快捷键可以编辑命令行内容。
Ctrl + d：删除光标位置的字符（delete）。
Ctrl + w：删除光标前面的单词。
Ctrl + t：光标位置的字符与它前面一位的字符交换位置（transpose）。
Alt + t：光标位置的词与它前面一位的词交换位置（transpose）。
Alt + l：将光标位置至词尾转为小写（lowercase）。
Alt + u：将光标位置至词尾转为大写（uppercase）。
使用Ctrl + d的时候，如果当前行没有任何字符，会导致退出当前 Shell，所以要小心。

剪切和粘贴快捷键如下。
Ctrl + k：剪切光标位置到行尾的文本。
Ctrl + u：剪切光标位置到行首的文本。
Alt + d：剪切光标位置到词尾的文本。
Alt + Backspace：剪切光标位置到词首的文本。
Ctrl + y：在光标位置粘贴文本。
同样地，Alt 键可以用 Esc 键代替。


除了命令或路径，Tab 还可以补全其他值。
如果一个值以$开头，则按下 Tab 键会补全变量；
如果以~开头，则补全用户名；
如果以@开头，则补全主机名（hostname），主机名以列在/etc/hosts文件里面的主机为准。

自动补全相关的快捷键如下。

Tab：完成自动补全。
Alt + ?：列出可能的补全，与连按两次 Tab 键作用相同。
Alt + /：尝试文件路径补全。
Ctrl + x /：先按Ctrl + x，再按/，等同于Alt + ?，列出可能的文件路径补全。
Alt + !：命令补全。
Ctrl + x !：先按Ctrl + x，再按!，等同于Alt + !，命令补全。
Alt + ~：用户名补全。
Ctrl + x ~：先按Ctrl + x，再按~，等同于Alt + ~，用户名补全。
Alt + $：变量名补全。
Ctrl + x $：先按Ctrl + x，再按$，等同于Alt + $，变量名补全。
Alt + @：主机名补全。
Ctrl + x @：先按Ctrl + x，再按@，等同于Alt + @，主机名补全。
Alt + *：在命令行一次性插入所有可能的补全。
Alt + Tab：尝试用.bash_history里面以前执行命令，进行补全。
上面的Alt键也可以用 ESC 键代替。


下面是一些与操作历史相关的快捷键。
Ctrl + p：显示上一个命令，与向上箭头效果相同（previous）。
Ctrl + n：显示下一个命令，与向下箭头效果相同（next）。
Alt + <：显示第一个命令。
Alt + >：显示最后一个命令，即当前的命令。
Ctrl + o：执行历史文件里面的当前条目，并自动显示下一条命令。这对重复执行某个序列的命令很有帮助。

感叹号!的快捷键如下。
!!：执行上一个命令。
!n：n为数字，执行历史文件里面行号为n的命令。
!-n：执行当前命令之前n条的命令。
!string：执行最近一个以指定字符串string开头的命令。
!?string：执行最近一条包含字符串string的命令。
!$：代表上一个命令的最后一个参数。
!*：代表上一个命令的所有参数，即除了命令以外的所有部分。
^string1^string2：执行最近一条包含string1的命令，将其替换成string2。


Ctrl + j：等同于回车键（LINEFEED）。
Ctrl + m：等同于回车键（CARRIAGE RETURN）。
Ctrl + o：等同于回车键，并展示操作历史的下一个命令。
Ctrl + v：将下一个输入的特殊字符变成字面量，比如回车变成^M。
Ctrl + [：等同于 ESC。
Alt + .：插入上一个命令的最后一个词。
Alt + _：等同于Alt + .。
EOF
