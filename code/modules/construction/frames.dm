<<<<<<< HEAD:code/game/machinery/wall_frames.dm
=======
/*
** FRAME BASE TYPE
*/
>>>>>>> 21d725c52bdab8afa70ab5407d52182fe3e44b78:code/modules/construction/frames.dm
/obj/item/frame
	name = "frame"
	desc = "Used for building machines."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "fire_bitem"
	flags = CONDUCT
	var/build_machine_type
	var/refund_amt = 2
	var/refund_type = /obj/item/stack/material/steel
	var/reverse = 0 //if resulting object faces opposite its dir (like light fixtures)

<<<<<<< HEAD:code/game/machinery/wall_frames.dm
/obj/item/frame/attackby(obj/item/W as obj, mob/user as mob)
	if (W.iswrench())
		new refund_type( get_turf(src.loc), refund_amt)
=======
/*
** FRAME BASE PROCS
*/

/obj/item/frame/attackby(obj/item/W, mob/user)
	if (W.iswrench())
		new refund_type(get_turf(src.loc), refund_amt)
>>>>>>> 21d725c52bdab8afa70ab5407d52182fe3e44b78:code/modules/construction/frames.dm
		qdel(src)
		return
	..()

<<<<<<< HEAD:code/game/machinery/wall_frames.dm
/obj/item/frame/proc/try_build(turf/on_wall)
	if(!build_machine_type)
		return

	if (get_dist(on_wall,usr)>1)
		return

	var/ndir
	if(reverse)
		ndir = get_dir(usr,on_wall)
	else
		ndir = get_dir(on_wall,usr)

	if (!(ndir in cardinal))
		return

	var/turf/loc = get_turf(usr)
	var/area/A = loc.loc
	if (!istype(loc, /turf/simulated/floor))
		to_chat(usr, "<span class='danger'>\The [src] Alarm cannot be placed on this spot.</span>")
		return
	if (A.requires_power == 0 || A.name == "Space")
		to_chat(usr, "<span class='danger'>\The [src] Alarm cannot be placed in this area.</span>")
		return

	if(gotwallitem(loc, ndir))
		to_chat(usr, "<span class='danger'>There's already an item on this wall!</span>")
		return

	var/obj/machinery/M = new build_machine_type(loc, ndir, 1)
=======
/obj/item/frame/proc/check_can_build(var/turf/on_wall, var/mob/user)
	if (get_dist(on_wall,user)>1)
		return FALSE
	var/ndir
	if(reverse)
		ndir = get_dir(user,on_wall)
	else
		ndir = get_dir(on_wall,user)
	if (!(ndir in cardinal))
		return FALSE
	var/turf/loc = get_turf(user)

	if(gotwallitem(loc, ndir))
		to_chat(user, "<span class='danger'>There's already an item on this wall!</span>")
		return FALSE
	return ndir

/obj/item/frame/proc/do_special_build(var/obj/machinery/M)
	return

/obj/item/frame/proc/try_build(turf/on_wall)
	if(!build_machine_type)
		return
	
	var/ndir = check_can_build(on_wall)
	if(!ndir)
		return

	var/obj/machinery/M = new build_machine_type(loc, ndir, 1)
	do_special_build(M)
>>>>>>> 21d725c52bdab8afa70ab5407d52182fe3e44b78:code/modules/construction/frames.dm
	M.fingerprints = src.fingerprints
	M.fingerprintshidden = src.fingerprintshidden
	M.fingerprintslast = src.fingerprintslast
	qdel(src)

<<<<<<< HEAD:code/game/machinery/wall_frames.dm
/obj/item/frame/fire_alarm
=======
/*
** FRAME SUBTYPES
*/

/obj/item/frame/alarm/check_can_build(var/turf/on_wall, var/mob/user)
	. = ..()
	var/area/A = loc.loc
	if (!istype(loc, /turf/simulated/floor))
		to_chat(user, "<span class='danger'>\The [src] cannot be placed on this spot.</span>")
		return FALSE
	if (A.requires_power == 0 || A.name == "Space")
		to_chat(user, "<span class='danger'>\The [src] cannot be placed in this area.</span>")
		return FALSE

/obj/item/frame/alarm/fire
>>>>>>> 21d725c52bdab8afa70ab5407d52182fe3e44b78:code/modules/construction/frames.dm
	name = "fire alarm frame"
	desc = "Used for building fire alarms."
	build_machine_type = /obj/machinery/firealarm
	reverse = 1

<<<<<<< HEAD:code/game/machinery/wall_frames.dm
/obj/item/frame/air_alarm
=======
/obj/item/frame/alarm/air
>>>>>>> 21d725c52bdab8afa70ab5407d52182fe3e44b78:code/modules/construction/frames.dm
	name = "air alarm frame"
	desc = "Used for building air alarms."
	icon_state = "alarm_bitem"
	build_machine_type = /obj/machinery/alarm

/obj/item/frame/light
	name = "light fixture frame"
	desc = "Used for building lights."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "tube-construct-item"
	build_machine_type = /obj/machinery/light_construct
	reverse = 1

/obj/item/frame/light/small
	name = "small light fixture frame"
	icon_state = "bulb-construct-item"
	refund_amt = 1
	build_machine_type = /obj/machinery/light_construct/small
