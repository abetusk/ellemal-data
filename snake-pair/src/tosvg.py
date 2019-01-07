#!/usr/bin/python


import os
import sys
import SVG

C = 5000.0

pen_width = 10

scene = SVG.Scene("border.svg")
scene.height = 10000
scene.width = 10000


prev = [-1.0,-1.0]
newPolygon = True

for line in sys.stdin:

  line = line.strip()
  if len(line)==0:
    newPolygon = True
    continue
  if line[0] == '#': continue
  parts = line.split(" ")

  x = C*float(parts[0])
  y = C*float(parts[1])

  print parts

  if newPolygon:
    prev[0] = x
    prev[1] = y
    newPolygon = False
    continue

  scene.add( SVG.Line( (prev[0],prev[1]), (x,y), (0,0,0), pen_width, 1.0 ) )

  prev[0] = x
  prev[1] = y

scene.write_svg( "border.svg")
