Accessibility utility

Version 1.04

By Dirst

A set of simple commands for the DFHack console to aid in navigating the map.  The current version includes four DFHack scripts.

Installation is simple.  Unzip Accessibility.zip onto your Dwarf Fortress folder.

access.lua
This script prints instructions for using the Accessibility utility

access
General instructions are printed if "access" is typed alone.

access help
More detailed documentation is available by typing "access help".

bookmark.lua
This script defines, updates and deletes persistent bookmarks on the map.

bookmark help
Prints a short summary of the bookmark comamands.

bookmark foo
Creates or updates the bookmark named "foo" at the current cursor location.  If the cursor is not present, the bookmark will be set as the center of the on-screen map.

bookmark list
Lists all current bookmarks, if any.

bookmark drop foo
Deletes a bookmark named foo.

bookmark clear all
Deletes ALL bookmarks.  Note the space between "clear" and "all" as a safety feature.

goto.lua
This script will move the map (and cursor if it is present) to a specific location.  The goto script has two modes: bookmark and coordinates.

goto help
Prints a short summary of the goto commands.

goto foo
Moves the map to the bookmark named foo, if it exists.

goto # # #
Moves the map to the specified X, Y, Z coordinates.

whereami.lua
This script reports your current location as X, Y, Z coordinates and a very terse description of the tile such as "SOIL WALL" or "POOL FLOOR".
whereami will also report if the current location is recorded as a bookmark.

whereami help
Prints the above description of this script.

Known issues:
Bookmarks saved with version 1.00 have incorrect Z coordinates.
Screen center is incorrect if the Text Will Be Text plugin is active, although the cursor location is accurate.