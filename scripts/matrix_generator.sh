#!/bin/bash

DIR=$1

echo -n '{"user_config": ['

first=true
for file in "$DIR"/*; do
  if [ "$first" = true ]; then
    first=false
  else
    echo -n ','
  fi
  echo -n \""$(basename $file)\""
done

echo -n ']}'