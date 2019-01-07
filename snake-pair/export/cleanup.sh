#!/bin/bash

ifn="$1"

offsetx=10
offsety=10

if [[ "$ifn" == "" ]] ; then
  echo "provide file"
  exit 1
fi

dos2unix $ifn
sed -i 's/;.*//' $ifn
sed -i 's/G0 *F[0-9]*//' $ifn
sed -i 's/G1 F\(.*\)/G1 F\1\nG0 F8000/' $ifn

mx=`ngc_bounds $ifn | grep min_x | cut -f2 -d' '`
my=`ngc_bounds $ifn | grep min_y | cut -f2 -d' '`

shiftx=` echo "-($mx) + $offsetx" | bc -l`
shifty=` echo "-($my) + $offsety" | bc -l`

tfn=`mktemp`

grecode -shift "$shiftx" "$shifty" $ifn > $tfn
mv $tfn $ifn

rm -f $tfn
