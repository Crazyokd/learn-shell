#!/usr/bin/env bash

# the system will automatically find the program(bash) you specify in the path environment variable
push(){
    git push -f origin main
}

push
while [[ $? -gt 0 ]]; do
  echo "push failed, try again..."
  push
done
