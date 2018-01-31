-- Reports coordinates of the cursor (or screen center).
-- Created by Dirst, initially to make text-mode DF more accessible to a screen reader
-- Additonal information listed as available, such as bookmark defined here and tile characteristics.
-- Version 1.04 added help text
-- Version 1.03 adds a check that a map is loaded, and is located to be global rather than save-specific.
-- Version 1.02 includes basic tile material and shape information.
-- Version 1.01 removes the need for the "calibrate" step and harmonizes reported Z with screen display.

local args = {...}

if args[1] == "help" or args[1] == "-help" then
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
	if not dfhack.isMapLoaded() then
		dfhack.printerr('Error: Map is not loaded.')
		return
	end

	local bookmarks = dfhack.persistent.get_all("BOOKMARK",true)
	local pos = {}
	pos = copyall(df.global.cursor)
	pos.z = pos.z + df.global.world.map.region_z
	local name = "Cursor:"
	if pos.x == -30000 then
		dm = require('gui.dwarfmode')
		name = "Center:"
		pos["x"] = df.global.window_x + math.floor(dm.getPanelLayout().map.width / 2)
		pos["y"] = df.global.window_y + math.floor(dm.getPanelLayout().map.height / 2)
		pos["z"] = df.global.window_z + df.global.world.map.region_z
	end

	local abs_pos = {}
	abs_pos["x"] = pos.x
	abs_pos["y"] = pos.y
	abs_pos["z"] = df.global.window_z

	local tile_type = dfhack.maps.getTileType(abs_pos)
	local tile_shape
	if dfhack.maps.getTileFlags(abs_pos).hidden == true then 
		tile_shape = "(HIDDEN)"
	else
		tile_shape = df.tiletype_material[df.tiletype.attrs[tile_type].material] .. " " .. df.tiletype_shape[df.tiletype.attrs[tile_type].shape]
	end
	print(name .. "  " .. pos.x .. "  " .. pos.y .. "  " .. pos.z .. ", " .. tile_shape)


	if bookmarks then
		for _, bookmark in ipairs(bookmarks) do
			if bookmark.ints[1] == pos.x and bookmark.ints[2] == pos.y and bookmark.ints[3] == pos.z then
				print("Bookmarked as " .. bookmark.value)
			end
		end
	end
end
