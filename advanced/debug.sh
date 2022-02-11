#!/usr/bin/env bash

:<<EOF
Options are options that can change the behavior of the shell. Here are some options that might be useful to you:
Short 	 Name 	 Description
-f 	 noglob 	 Disable file name globbing
-i 	 interactive Let the script run in interactive mode
-n 	 noexec 	 Read command without executing (syntax check)
-t 	    —	     Exit after executing the first command
-v 	 verbose 	 Before executing each command, output the command to stderr
-x 	 xtrace 	 Before executing each command, output the command and its extended parameters to stderr
EOF

for (( i = 0; i < 3; i++ )); do
  echo $i
done

# open debug
set -x
for (( i = 0; i < 3; i++ )); do
  printf ${i}
done


# close debug
set +x


for i in {1..5}; do printf ${i}; done
printf "\n"