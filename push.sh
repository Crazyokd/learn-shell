#!/usr/bin/env bash

# the system will automatically find the program(bash) you specify in the path environment variable
push(){
    git push -f origin main
}

while [[ 1 -gt 0 ]]; do
  if [[ $? -gt 0 ]]; then 
    push
  else 
    echo "push failed, try again..."
  fi
done
