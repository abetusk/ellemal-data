Bat Patch
===

Using GIMP, these are some important steps:

* Carve out the relevant section of [Haeckel's original plate](https://en.wikipedia.org/wiki/Bat#/media/File:Haeckel_Chiroptera.jpg)
* Create a new workspace with the original picture as it's own layer
* Apply a "Neon" edge-detect filter (radius `1.0` and `0.80` amount maybe?)
* Create a black 'frame' for the image on it's own layer underneath the edge-detected layer.
  I created a simple frame for the `0.1.x` versions (meant to look like stylized 'vector' clouds) by
  creating large difference sizes of hard-edged circle pencil strokes with long linear sections that cover the entirety
  of the (now filtered) bat.
* Duplicate the outline layer and invert the color to white. Erode multiple times (5-10) to get a good white outline.
  Too small and the rastered laser image won't cut all the way through.
* "clean up" the edge detected image to try and connect some isolated images. I also peppered the white regions
  that might completely isolate some detail with a single pixel pencil that's been jittered (I used `8`) to try
  and mitigate regions being completely cut out.
* Put it all in a group in the proper z-order and export to a PNG.

Once exported open it with `laserweb`:

* Import the PNG
* Reposition and resize as appropriate. For my purposes, I resized to about 235mm width to try and fit to an A6 EL panel.
* Drag the imported file to the appropriate section for GCode conversion
* Set the feed rate to 3000
* Select the 'invert' option and unset the 'burn white' option
* Generate the GCode and save it.

The output is in a DOS format (carriage return and line feed after every line) so I clean it up by running `dos2unix`.
I also remove the comments (`s/;.*//`) in addition to adding a `G0 F5000` at the top to make the rapid motion faster.

I use a cotton polyester or rayon fabric (I can't remember which). I believe it's the 100% rayon as it melts and feels
synthetic.
The fabric has the nice property that it melts so that even regions that might otherwise be completely isolated
still might connect because of the melted edges.

I make sure to remove any covering the EL panel has.
To apply the cut out 'patch' to the EL panel, I first trace out the patch onto the A6 panel with pencil.
The panel should not be on when cutting as this can potentially cause a shock.
From the traced out patch, I cut out the excess panel portions making sure to leave a 'tongue' of where the
wires connect to the panel.

Once I'm satisfied that the patch can cover the panel, I glue the patch onto the panel with Gorilla glue.
I've found that other glue has a hard time bonding, including Elmer's, super glue and model glue.
Gorilla glue works well but is messy and leaves bumps or other gunk so it should be applied sparingly.
The Gorilla glue is strong, so only a small amount needs to be applied.

I apply the Gorilla glue in small drops on the back of the cloth patch, make sure to focus on regions that are
mostly fabric and making sure there's at least some glue on portions of the patch that are 'flaps' and might easily
come off of the panel.
The glue is transparent and is hard to see when the patch is lit up, so it's not critical to be so careful but
too much will make it look unseemly.

I try and use disposable latex gloves for the glue application as it can be a little messy.
I've tried different methods to get the glue from the bottle to the cloth, like using a stick to
apply the glue onto the patch, but I've found it easier to just apply it directly in small
dabs from the glue bottle directly to the back of the cloth patch.

Once the glue is on the back of the cloth patch, I apply it to the panel, doing fine repositioning while
the glue is still wet.
Once the glue has dried enough to be fixed in place, I shave off any excess panel that I need to, in case
there's some poking out of the edges.

On the back of the EL panel, I put a couple of Velcro strips.
On a jacket, I do an initial 'spot' position the panel to get a good sense for where it's placed.
Once I'm satisfied with the position, I stick the Velcro counterpart onto the jacket.
I also cut a small access hole to the EL panel 'tongue' and feed the panel through.

Once the wire is in the jacket, I tear a small hole in the lining so that I can grab and manipulate the wiring
easily.
I tear a small hole in one of the pockets and put the EL inverter (along with it's battery pack) into the jacket
pocket and feed the wire through the hole just created.
I connect the EL inverter to the EL panel wire.

Once I do a quick test to make sure everything still works, the jacket is ready to wear.

License
---

Everything in this directory, unless explicitly stated otherwise, is under a CC0 license.
