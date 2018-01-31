-- Information about Accessibility features
-- Created by Dirst, initially to make text-mode DF more accessible to a screen reader
-- Prints general instructions for using bookmark, goto and wherami.
-- Enter "access help" for more detailed documentation.
-- Version 1.04 is the first version with the "access" script.

local args = {...}

if args[1] == "help" or args[1] == "-help" then
	dfhack.color(14)
	dfhack.println("Accessibility Utility v1.04")
	dfhack.color(-1)
	dfhack.println("A set of three scripts that allow simple navigation of the map from")
	dfhack.println("the DFHack console: ")
	dfhack.color(10)
	dfhack.print("bookmark")
	dfhack.color(-1)
	dfhack.print(", ")
	dfhack.color(10)
	dfhack.print("goto")
	dfhack.color(-1)
	dfhack.print(", and")
	dfhack.color(10)
	dfhack.print("whereami")
	dfhack.color(-1)
	dfhack.println(".")
	dfhack.println(" ")
	
	dfhack.color(10)
	dfhack.println("bookmark")
	dfhack.color(-1)
	dfhack.println("Sets and manages persistent bookmarks on the map.")
	dfhack.print("Enter ")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(11)
	dfhack.print("foo ")
	dfhack.color(-1)
	dfhack.print("to create a bookmark named ")
	dfhack.color(11)
	dfhack.print("foo ")
	dfhack.color(-1)
	dfhack.println("at the current location.")
	dfhack.println("Any one-word string may be used except the following reserved words:")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(11)
	dfhack.print("help ")
	dfhack.color(-1)
	dfhack.println("prints a command summary.")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(11)
	dfhack.print("-help ")
	dfhack.color(-1)
	dfhack.println("prints the same command summary.")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(11)
	dfhack.print("list ")
	dfhack.color(-1)
	dfhack.println("prints a list of existing bookmarks.")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(11)
	dfhack.print("drop foo ")
	dfhack.color(-1)
	dfhack.print("erases a bookmark named ")
	dfhack.color(11)
	dfhack.print("foo")
	dfhack.color(-1)
	dfhack.println(".")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(11)
	dfhack.print("clear all ")
	dfhack.color(-1)
	dfhack.println("erases all current bookmarks. Note the")
	dfhack.print("space between ")
	dfhack.color(11)
	dfhack.print("clear ")
	dfhack.color(-1)
	dfhack.print("and ")
	dfhack.color(11)
	dfhack.print("all")
	dfhack.color(-1)
	dfhack.println(".")
	
	dfhack.color(10)
	dfhack.println("goto")
	dfhack.color(-1)
	dfhack.print("Move the viewer to a bookmark or a set of coordinates.")
	dfhack.print("Enter ")
	dfhack.color(10)
	dfhack.print("goto ")
	dfhack.color(11)
	dfhack.print("# # # ")
	dfhack.color(-1)
	dfhack.println("to move the screen to a set of XYZ coordinates.")
	dfhack.print("Enter ")
	dfhack.color(10)
	dfhack.print("goto ")
	dfhack.color(11)
	dfhack.print("foo ")
	dfhack.color(-1)
	dfhack.print("to move the screen to be centered on bookmark ")
	dfhack.color(11)
	dfhack.print("foo")
	dfhack.color(-1)
	dfhack.println(".")
	dfhack.color(10)
	dfhack.print("goto ")
	dfhack.color(11)
	dfhack.print("help ")
	dfhack.color(-1)
	dfhack.println("prints a command summary.")
	
	dfhack.color(10)
	dfhack.println("whereami")
	dfhack.color(-1)
	dfhack.println("This script reports your current location as X, Y, Z coordinates and a very")
	dfhack.println("terse description of the tile such as SOIL WALL or POOL FLOOR.")
	dfhack.color(10)
	dfhack.print("whereami ")
	dfhack.color(-1)
	dfhack.println("will also report if the current location is recorded as a bookmark.")
else
	dfhack.color(14)
	dfhack.println("Accessibility Utility v1.04")
	dfhack.color(-1)
	dfhack.println("A set of three scripts that allow simple navigation of the map from")
	dfhack.println("the DFHack console.")
	dfhack.print("Use ")
	dfhack.color(10)
	dfhack.print("bookmark ")
	dfhack.color(-1)
	dfhack.println("to set and manage persistent bookmarks on the map.")
	dfhack.print("Use ")
	dfhack.color(10)
	dfhack.print("goto ")
	dfhack.color(-1)
	dfhack.println("to move to a bookmark or a set of coordinates.")
	dfhack.print("Use ")
	dfhack.color(10)
	dfhack.print("whereami ")
	dfhack.color(-1)
	dfhack.println("to get the current location, and its bookmark name")
	dfhack.println("if applicable.")
	dfhack.println(" ")
	dfhack.print("Type ")
	dfhack.color(10)
	dfhack.print("access help ")
	dfhack.color(-1)
	dfhack.println("for more information.")
end