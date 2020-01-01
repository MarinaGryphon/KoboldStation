/datum/gear/uniform/hazardsuit
	display_name = "hazard suit"
	path = /obj/item/clothing/under/offworlder

/datum/gear/uniform/hazardsuit/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice

/datum/gear/uniform/hazardsuit/skirt
	display_name = "hazard skirt"
	path = /obj/item/clothing/under/skirt/offworlder

/datum/gear/cooler
	display_name = "gas cooler"
	path = /obj/item/tank/cooler
	cost = 0 
