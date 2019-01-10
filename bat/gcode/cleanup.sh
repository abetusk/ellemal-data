#!/bin/bash

ingc="$1"

if [[ "$ingc" == "" ]] ; then
  echo "provide gcode file"
  exit 1
fi

dos2unix $ingc
sed -i 's/;.*//' $ingc
