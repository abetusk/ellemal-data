#!/bin/bash
#


#ifn="./witch.ngc"

function process {
  ifn="$1"
  fillx2="$2"
  filly2="$3"

  offset=20

  ofn="./"`basename $ifn .ngc`"-framed.ngc"

  mx=`ngc_bounds $ifn | egrep '^min_x:' | cut -f2 -d' '`
  Mx=`ngc_bounds $ifn | egrep '^max_x:' | cut -f2 -d' '`
  my=`ngc_bounds $ifn | egrep '^min_y:' | cut -f2 -d' '`
  My=`ngc_bounds $ifn | egrep '^max_y:' | cut -f2 -d' '`

  dx=`echo "( $Mx - $mx ) " | bc -l`
  dy=`echo "( $My - $my ) " | bc -l`

  midx=`echo "( ( $Mx - $mx ) / 2 ) + $mx" | bc -l`
  midy=`echo "( ( $My - $my ) / 2 ) + $my" | bc -l`

  #echo "$mx $Mx $my $My"
  #echo "dx dy ($dx $dy)"
  #echo "midx midy ($midx $midy)"

  bx0=`echo "( ( - $dx / 2 ) - $fillx2 )" | bc -l`
  bx1=`echo "( ( $dx / 2 ) + $fillx2 )" | bc -l`

  by0=`echo "( ( - $dy / 2 ) - $filly2 )" | bc -l`
  by1=`echo "( ( $dy / 2 ) + $filly2 )" | bc -l`

  findx=`echo "( $midx + ( $fillx2 * 2 ) + $offset )" | bc -l`
  findy=`echo "( $midy + ( $filly2 * 2 ) + $offset )" | bc -l`

  echo "cat \
    <( ngc_translate -f $ifn -x \"-$midx\" -y \"-$midy\" ) \
    <( echo -e \"G0 X$bx0 Y$by0\nG1 X$bx1 Y$by0\nG1 X$bx1 Y$by1\nG1 X$bx0 Y$by1\nG1 X$bx0 Y$by0\n\" ) | \
    ngc_translate -f - -x $findx -y $findy -U -S -o $ofn"

  cat \
    <( ngc_translate -f $ifn -x "-$midx" -y "-$midy" ) \
    <( echo -e "G0 X$bx0 Y$by0\nG1 X$bx1 Y$by0\nG1 X$bx1 Y$by1\nG1 X$bx0 Y$by1\nG1 X$bx0 Y$by0\n" ) | \
    ngc_translate -f - -x $findx -y $findy -U -S -o $ofn


  #echo $ifn $ofn
}

#process "./witch.ngc" 
process "./cat.ngc" 15  25
