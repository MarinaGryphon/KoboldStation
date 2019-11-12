// A 16x16 grid of the map with a list of turfs that can be seen, are visible and are dimmed.
// Allows the Eye to stream these chunks and know what it can and cannot see.

/datum/chunk/cult/acquireVisibleTurfs(var/list/visible)
	for(var/mob/living/L in living_mob_list)
		for(var/turf/t in L.seen_cult_turfs())
			visible[t] = t
