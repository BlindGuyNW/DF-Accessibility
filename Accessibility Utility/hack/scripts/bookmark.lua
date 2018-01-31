-- Set and clears persistent bookmarks on the fort map.
-- Created by Dirst, initially to make text-mode DF more accessible to a screen reader
-- Enter "bookmark help" for a list of reserved names.
-- Version 1.04 improved help text
-- Version 1.03 adds a check that a map is loaded, and is located to be global rather than save-specific.
-- Version 1.02 of bookmark is unchanged from 1.01.
-- Version 1.01 removes the need for the "calibrate" step and harmonizes reported Z with screen display.

local args = {...}

if args[1] == "help" or args[1] == "-help" then
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

else
	local bookmarks = dfhack.persistent.get_all("BOOKMARK",true)

	if not dfhack.isMapLoaded() then
		dfhack.printerr('Error: Map is not loaded.')
		return
	end

	if args[1] == "list" then
		if bookmarks then
			for _, bookmark in ipairs(bookmarks) do
				print(bookmark.value .. ":  " .. bookmark.ints[1] .. "  " .. bookmark.ints[2] .. "  " .. bookmark.ints[3])
			end
		else
			print("No bookmarks defined.")
		end

	elseif args[1] == "clear" and args[2] == "all" then
		if bookmarks then
			local count = #bookmarks
			for _, bookmark in ipairs(bookmarks) do
				bookmark:delete()
			end
			print("Deleted " .. count .. " bookmarks.")
		else
			print("No bookmarks are defined, so no action taken.")
		end

	elseif args[1] == "drop" and args[2] then
		if bookmarks then
			local del = false
			for _, bookmark in ipairs(bookmarks) do
				if bookmark.value == args[2] then 
					bookmark:delete()
					print("Bookmark " .. args[2] .. " deleted.")
					del = true
				end
			end
			if del == false then print("Bookmark " .. args[2] .. " not defined, so no action taken.") end
		else
			print("No bookmarks are defined, so no action taken.")
		end

	elseif args[1] and not args[2] then 
		local pos = {}
		pos = copyall(df.global.cursor)
		pos.z = pos.z + df.global.world.map.region_z
		local make_new = true
		if pos.x == -30000 then
			name = "Center:"
			dm = require('gui.dwarfmode')
			pos["x"] = df.global.window_x + math.floor(dm.getPanelLayout().map.width / 2)
			pos["y"] = df.global.window_y + math.floor(dm.getPanelLayout().map.height / 2)
			pos["z"] = df.global.window_z + df.global.world.map.region_z
		end
		if bookmarks then
			for _, bookmark in ipairs(bookmarks) do
				if bookmark.value == args[1] then 
					bookmark.ints[1] = pos.x
					bookmark.ints[2] = pos.y
					bookmark.ints[3] = pos.z
					bookmark:save()
					print("Bookmark " .. args[1] .. " updated.")
					make_new = false
				end
			end
			if make_new == true then 
				dfhack.persistent.save({key="BOOKMARK/"..args[1],value=args[1],ints={pos.x,pos.y,pos.z}})
				print("Bookmark " .. args[1] .. " created.")
			end
		else
			dfhack.persistent.save({key="BOOKMARK/"..args[1],value=args[1],ints={pos.x,pos.y,pos.z}})
			print("Bookmark " .. args[1] .. " created.")
		end
		
	else
		print([[
Invalid command.  Use "bookmark help" for help.
]])
	end
end
