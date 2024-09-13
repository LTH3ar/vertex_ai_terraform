#!/bin/bash

DIR=$1 # Path to the directory containing the user config files

echo -n '{"user_config": ['

first=true
for file in "$DIR"/*; do
  if [ "$first" = true ]; then
    first=false
  else
    echo -n ','
  fi
  echo -n \""$(basename "$file")\"" # Get the filename without the path
done

echo -n ']}'