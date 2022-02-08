#!/usr/bin/env bash

# the system will automatically find the program(bash) you specify in the path environment variable
push(){
    git push -f origin main
}

while [[ 1 -gt 0 ]]; do
  push
  if [[ $? -gt 0 ]]; then
    echo "push failed, try again..."
  else 
    echo "push success"
    break
  fi
done
