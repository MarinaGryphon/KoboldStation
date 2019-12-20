#define DAYLENGTH	(17 HOURS)
var/datum/controller/subsystem/sun/sun

/datum/controller/subsystem/sun
	name = "Sun"
	flags = SS_NO_INIT | SS_POST_FIRE_TIMING | SS_BACKGROUND
	wait = 5 MINUTES
	priority = SS_PRIORITY_SUN
	init_order = SS_INIT_SUN

	var/tmp/angle
	var/tmp/dir
	var/tmp/power
	var/tmp/dx
	var/tmp/dz
	var/tmp/list/solars			// for debugging purposes, references solars_list at the constructor
	var/tmp/list/updating_solars
	var/tmp/solar_next_update	// last time the sun position was checked and adjusted

/datum/controller/subsystem/sun/New()
	NEW_SS_GLOBAL(sun)
	LAZYINITLIST(solars)

	solar_next_update = world.time	// init the timer
	fire()

/datum/controller/subsystem/sun/proc/update_angle(var/ang)
	angle = ang
	dz = sin(angle) // vertical component
	dx = SIGN(cos(angle)) // sign of horizontal component
	power = max(0, -angle*(angle-180)/(90*90))
	if(power == 0)
		SSsunlight.set_overall_light(FALSE)
		return
	var/lightdir = (round(angle, 5) < 90) ? WEST : EAST
	if(round(angle, 10) == 90)
		lightdir = null
	if(lightdir && (!dir || (lightdir != dir)))
		dir = lightdir
		SSsunlight.set_dir(lightdir)
	SSsunlight.set_overall_light(min(Ceiling(config.sun_accuracy * 1.2)/min(1, power), config.sun_accuracy * 2), power, src.getcolor(), round(power*255), 90)

/datum/controller/subsystem/sun/proc/getcolor()
	switch(angle)
		if(180 to 360)
			. = "#000000"
		if(30 to 150)
			. = "#FFFFFF"
		else
			. = "#fd5e53"
	//return rgb(GetRedPart(.)*power, GetGreenPart(.)*power, GetBluePart(.)*power)

/datum/controller/subsystem/sun/stat_entry()
	..("A:[angle] S:[LAZYLEN(solars)]")

/datum/controller/subsystem/sun/fire(resumed = 0)
	if (!resumed)
		update_angle(((world.realtime/DAYLENGTH) * 360) % 360 - 90) // 0 to 180 is up; 0 to 30 and 150 to 180 is sunrise/sunset; 90 is noon
		updating_solars = solars.Copy()

	//now tell the solar control computers to update their status and linked devices
	while (updating_solars.len)
		var/obj/machinery/power/solar_control/SC = updating_solars[updating_solars.len]
		updating_solars.len--

		if (QDELETED(SC) || !SC.powernet)
			solars -= SC
			continue

		SC.update()

		if (MC_TICK_CHECK)
			return
