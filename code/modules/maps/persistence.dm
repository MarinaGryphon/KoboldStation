/hook/shutdown/proc/savemap()
	if(!current_map || !current_map.persist || !current_map.persist_levels)
		return 0
	world.log << "Saving [current_map.path]."
	for(var/i in current_map.persist_levels)
		world.log << "Saving [current_map.path][i]."
		. += SwapMaps_SaveChunk("[current_map.path][i]", locate(1,1,i), locate(world.maxx, world.maxy, i))
		world.log << "Done saving [current_map.path][i]."
	world.log << "Successfully saved [.] levels."