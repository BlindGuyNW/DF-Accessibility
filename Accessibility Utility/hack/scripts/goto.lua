-- Move the screen to a bookmark or a set of XYZ coordinates.
-- Created by Dirst, initially to make text-mode DF more accessible to a screen reader
-- Enter "bookmark help" for a list of reserved names.
-- Version 1.04 improved help text.
-- Version 1.03 adds a check that a map is loaded, and is located to be global rather than save-specific.
-- Version 1.02 of goto is unchanged from 1.01.
-- Version 1.01 removes the need for the "calibrate" step, harmonizes reported Z with screen display, and checks bounds on target coordinates.

local args = {...}

if args[1] == "help" or args[1] == "-help" then
	dfhack.color(10)
	dfhack.println("goto.lua")
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
	dfhack.println("prints this command summary.")

else
	local bookmarks = dfhack.persistent.get_all("BOOKMARK",true)
	if not dfhack.isMapLoaded() then
		dfhack.printerr('Error: Map is not loaded.')
		return
	end
	if args[1] and not args[2] then
		if bookmarks then
			local pos = {}
			local xcoord = df.global.cursor.x
			for _, bookmark in ipairs(bookmarks) do
				if bookmark.value == args[1] then
					pos["x"] = bookmark.ints[1]
					pos["y"] = bookmark.ints[2]
					pos["z"] = bookmark.ints[3]
				end
			end
			if pos.x then
				dm = require('gui.dwarfmode')
				if xcoord ~= -30000 then df.global.cursor.x = pos.x end
				df.global.cursor.y = pos.y
				df.global.cursor.z = pos.z - df.global.world.map.region_z
				df.global.window_x = math.max(pos.x - math.floor(dm.getPanelLayout().map.width / 2), 0)
				df.global.window_y = math.max(pos.y - math.floor(dm.getPanelLayout().map.height / 2), 0)
				df.global.window_z = pos.z - df.global.world.map.region_z
				print("Now at " .. args[1])
			else
				print("Bookmark " .. args[1] .. " not defined.")
			end
		else
			print("No bookmarks defined.")
		end

	elseif args[1] and args[2] and args[3] then
		local pos_x = tonumber(args[1])
		local pos_y = tonumber(args[2])
		local pos_z = tonumber(args[3]) - df.global.world.map.region_z
		local max_x = df.global.world.map.x_count - 1
		local max_y = df.global.world.map.y_count - 1
		local max_z = df.global.world.map.z_count - 1
		if pos_x > max_x or pos_y > max_y or pos_z > max_z or pos_x < 0 or pos_y < 0 or pos_z < 0 then
			print("Target out of range.")
		else
			local dm = require('gui.dwarfmode')
			local size_x = dm.getPanelLayout().map.width
			local size_y = dm.getPanelLayout().map.height
			local half_x = math.floor(size_x / 2)
			local half_y = math.floor(size_y / 2)
			local window_x = math.min(math.max(pos_x - half_x, 0), max_x - size_x)
			local window_y = math.min(math.max(pos_y - half_y, 0), max_y - size_y)
			local xcoord = df.global.cursor.x
			if xcoord ~= -30000 then 
				df.global.cursor.x = pos_x
				df.global.cursor.y = pos_y
			else
				df.global.cursor.y = window_y + half_y
			end
			df.global.cursor.z = pos_z
			df.global.window_x = window_x
			df.global.window_y = window_y
			df.global.window_z = pos_z
			if xcoord == -30000 and (pos_x ~= window_x + half_x or pos_y ~= window_y + half_y) then
				print("Too close to edge. Now at " .. window_x + half_x .. "  " .. window_y + half_y .. "  " .. pos_z + df.global.world.map.region_z)
			else
				print("Now at " .. pos_x .. "  " .. pos_y .. "  " .. pos_z + df.global.world.map.region_z)
			end
		end
		
	else
		dfhack.color(12)
		dfhack.println([[
Invalid command.  Use "goto help" for help.
]])
		dfhack.color(-1)
	end
end
