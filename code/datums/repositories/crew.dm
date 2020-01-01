#define ZERO_WIDTH_SPACE "&#8203;" //prevents the UI elements from popping out of place when viewport gets too small

var/global/datum/repository/crew/crew_repository = new()

/datum/repository/crew
	var/list/cache_data

/datum/repository/crew/New()
	cache_data = list()
	..()


#undef ZERO_WIDTH_SPACE