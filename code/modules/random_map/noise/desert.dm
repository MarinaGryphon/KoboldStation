/datum/random_map/noise/desert
	descriptor = "desert"
	smoothing_iterations = 3
	target_area_type = /area/mine

/datum/random_map/noise/desert/replace_space
	descriptor = "desert (replacement)"
	target_turf_type = /turf/space

/datum/random_map/noise/desert/get_appropriate_path(var/value)
	return /turf/simulated/floor/planet/sand

/datum/random_map/noise/desert/get_additional_spawns(var/value, var/turf/T)
	var/val = min(9,max(0,round((value/cell_range)*10)))
	if(isnull(val)) val = 0
	switch(val)
		if(5 to 6)
			if(prob(20))
				var/grass_path = pick(subtypesof(/obj/structure/flora/ausbushes))
				new grass_path(T)
		if(7 to 9)
			if(prob(60))
				new /obj/structure/flora/ausbushes/sparsegrass(T)
			else if(prob(5))
				new /obj/structure/flora/tree/dead(T)

/datum/random_map/noise/desert/get_map_char(var/value)
	return "<font color='#[value][value][value][value][value][value]'>[pick(list(",",".","'","`"))]</font>"