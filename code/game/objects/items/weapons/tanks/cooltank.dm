/obj/item/tank/cooler
	name = "\improper gas cooler"
	desc = "A large, bulky setup that looks suspiciously like an air tank. It has a system of tubes, heatsinks, and radiators to cool air for poor, unfortunate Loamers and elves to breathe."
	volume = 1 // one litre buffer
	processes = FALSE

/obj/item/tank/cooler/return_air()
	var/turf/T = get_turf(src)
	var/datum/gas_mixture/turfair = T.return_air()
	var/moles_to_take = (turfair.return_pressure()*volume)/(R_IDEAL_GAS_EQUATION*turfair.temperature) // two breaths = 1L
	air_contents = T.remove_air(moles_to_take)
	var/mob/living/carbon/human/H
	if(istype(loc, /mob/living/carbon/human))
		H = loc
	else if(istype(loc.loc, /mob/living/carbon/human))
		H = loc.loc
	air_contents.temperature = (H.bodytemperature + turfair.temperature)/2
	air_contents.update_values()
	. = ..()

/obj/item/tank/cooler/check_status()
	return 

/obj/item/tank/cooler/process()
	return

/obj/item/tank/cooler/ui_interact()
	return

/obj/item/tank/cooler/attackby(obj/item/W as obj, mob/user as mob)
	return 

/obj/item/tank/cooler/attack_self(mob/user as mob)
	return 