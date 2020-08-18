# Switches
Switches on their own have no effect whatsoever.
You can step on them and they will animate a pressed switch, but won't
affect anything in the level

For switches to have an effect in the level, they must be tied to
an Effect Object. The Effect Object will tell which switches
are tied to it byt setting it up in the Editor.
Meaning, the switches are not responsible for deciding which Effect Object
they will affect.

They can only have a single Effect object (This can be changed in the future)

# Effect Objects

There are two types of Effect Objects:
* Single switch
* Multiple Switch

## Single Switch
The Single switch Effect object is only tied to a single switch.
This switch is set up via the editor by assigning the nodepath in the
Effect Object Inspector for the switch.

## Multiple Switch
The Multiple switch Effect object is tied to many switches.
These switches are assigned via the editor.

One bug I realized is that you can overwrite a switches Effect Object if you assigned a switch to multiple Effect Objects.

# States of Effect Objects
Effect Objects can be of:
* Single - Once the effect is on, it remains on
* Constant - All the switches must remain on for the effect to remain on
