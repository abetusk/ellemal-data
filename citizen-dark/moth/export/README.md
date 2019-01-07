Export Notes
===

Using [LaserWeb4](https://github.com/LaserWeb/LaserWeb4), import the `moth_v0.1.6.4.png` image (or whatever the most current/desired image is).


The parameters I'm using are:

* Laser Power `Min 0`, `Max 100` (percent `%`)
* 1 Pass
* Laser Diameter `0.2` (`mm`)
* Cut Rate of `4999` (`mm/minute`)
* **Unselect**  `Burn White`
* **Select** `Invert Color`

For each destination patch size, the image needs to be rescaled and the GCode regenerated.
The borders of the picture are black so the scale needs to account for the border to make
sure the portions of the image that are being cut are the proper size.

Here are the parameters I used to rescale:

| Destination patch size | Rescale (X) size |
|---|---|
| 100mm | 105mm |
| ~150mm~ | ~220mm~ (don't have this in white) |
| 210mm | 180mm |
| 300mm | 430mm (?) |

After each rescale and GCode generation, the image is saved into a file called
`moth_s<size>.ngc`, where `<size>` is the destination patch size.

Each needs to be 'cleaned' to take out extraneous content that LaserWeb4 generates
and to reposition so the work starts at the `(10,10)` (`mm`) mark.
The script `cleanup.sh` does this automatically, altering the GCode file in place.

Here is an example usage of the `cleanup.sh` script:

```
./cleanup.sh moth_s100.ngc
```

Note that the `cleanup.sh` script requires `grecode` and `dos2unix` to function properly.
