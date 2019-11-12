/datum/map/kobold
	name = "Naarvat"
	full_name = "Naarvat"
	path = "kobold"

	lobby_screens = list("aurora_asteroid", "aurora_postcard")

	station_levels = list(1, 2, 3)
	admin_levels = list()
	contact_levels = list(1, 2, 3)
	player_levels = list(1, 2, 3)
	persist_levels = list(1, 2, 3)
	restricted_levels = list()
	accessible_z_levels = list()
	base_turf_by_z = list(
		"1" = /turf/simulated/floor/planet/sand/rocky,
		"2" = /turf/simulated/floor/planet/sand/rocky,
		"3" = /turf/simulated/floor/planet/sand
	)

	has_space_ruins = FALSE

	station_name = "TK-9584 \'Naarvat\'"
	station_short = "Naarvat"
	system_name = "TK"

	command_spawn_enabled = FALSE
	persist = TRUE

/datum/map/kobold/generate_asteroid()
	// Create the desert.
	new /datum/random_map/noise/ore/surface(null, 0, 0, 3, 255, 255)				//low ore chance
	new /datum/random_map/noise/ore(null, 0, 0, 2, 255, 255)						//normal ore chance
	new /datum/random_map/noise/ore/deep(null, 0, 0, 1, 255, 255)					//high ore chance
	if(SSatlas.loaded_save)
		return
	new /datum/random_map/noise/desert(null, 0, 0, 3, 255, 255)
	new /datum/random_map/automata/cave_system/chasms(null, 0, 0, 2, 255, 255)
	new /datum/random_map/automata/cave_system(null, 0, 0, 2, 255, 255)
	new /datum/random_map/automata/cave_system/chasms(null, 0, 0, 1, 255, 255)
	new /datum/random_map/automata/cave_system/high_yield(null, 0, 0, 1, 255, 255)
