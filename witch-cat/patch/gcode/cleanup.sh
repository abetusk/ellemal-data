#!/bin/bash

ingc="$1"

if [[ "$ingc" == "" ]] ; then
  echo "provide input ngc file"
  exit 1
fi

dos2unix $ingc
sed -i 's/;.*//' $ingc
