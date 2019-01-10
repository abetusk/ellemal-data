#!/bin/bash

ifn="VID_20190107_215622.mp4"
ofn="cd-walk.mp4"

ffmpeg -i $ifn -vf 'transpose=1' $ofn
