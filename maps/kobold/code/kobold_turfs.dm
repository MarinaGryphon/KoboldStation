/turf/simulated/floor/planet/sand
	name = "desert"
	icon = 'icons/misc/beach.dmi'
	footstep_sound = "sandstep"
	icon_state = "desert"
	oxygen = MOLES_OXYGEN_NAARVAT
	nitrogen = MOLES_NITROGEN_NAARVAT
	carbon_dioxide = MOLES_CARBONDIOXIDE_NAARVAT
	temperature = TEMPERATURE_NAARVAT

/turf/simulated/floor/planet
	var/dug = 0 //Increments by 1 every time it's dug. 11 is the last integer that should ever be here.
	var/digging
	has_resources = 1
	roof_type = null

/turf/simulated/floor/planet/ex_act(severity)
	switch(severity)
		if(3.0)
			return
		if(2.0)
			if (prob(70))
				dug += rand(4,10)
				gets_dug(through = TRUE)
			else
				dug += rand(1,3)
				gets_dug(through = TRUE)
		if(1.0)
			if(prob(30))
				dug = 11
				gets_dug(through = TRUE)
			else
				dug += rand(4,11)
				gets_dug(through = TRUE)
	return


/turf/simulated/floor/planet/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!W || !user)
		return 0

	if (istype(W, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = W
		if (R.use(1))
			to_chat(user, "<span class='notice'>Constructing support lattice ...</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			ReplaceWithLattice()
		return

	if (istype(W, /obj/item/stack/tile/floor))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/floor/S = W
			if (S.get_amount() < 1)
				return
			qdel(L)
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			S.use(1)
			ChangeTurf(/turf/simulated/floor)
			return
		else
			to_chat(user, "<span class='warning'>The plating is going to need some support.</span>")
			return

	var/static/list/usable_tools = typecacheof(list(
		/obj/item/weapon/shovel,
		/obj/item/weapon/pickaxe/diamonddrill,
		/obj/item/weapon/pickaxe/drill,
		/obj/item/weapon/pickaxe/borgdrill
	))
	var/static/list/pen_tools = typecacheof(list(
		/obj/item/weapon/pickaxe/diamonddrill,
		/obj/item/weapon/pickaxe/drill,
		/obj/item/weapon/pickaxe/borgdrill
	))

	if(is_type_in_typecache(W, usable_tools))
		var/turf/T = user.loc
		if (!(istype(T)))
			return
		if(digging)
			return
		if(dug)
			if(!GetBelow(src))
				return
			to_chat(user, "<span class='warning'>You start digging deeper.</span>")
			playsound(user.loc, 'sound/effects/stonedoor_openclose.ogg', 50, 1)
			digging = 1
			if(!do_after(user, 60/W.toolspeed))
				if (istype(src, /turf/simulated/floor/planet))
					digging = 0
				return

			// Turfs are special. They don't delete. So we need to check if it's
			// still the same turf as before the sleep.
			if (!istype(src, /turf/simulated/floor/planet))
				return

			playsound(user.loc, 'sound/effects/stonedoor_openclose.ogg', 50, 1)
			if(prob(33))
				switch(dug)
					if(1)
						to_chat(user, "<span class='notice'>You've made a little progress.</span>")
					if(2)
						to_chat(user, "<span class='notice'>You notice the hole is a little deeper.</span>")
					if(3)
						to_chat(user, "<span class='notice'>You think you're about halfway there.</span>")
					if(4)
						to_chat(user, "<span class='notice'>You finish up lifting another pile of dirt.</span>")
					if(5)
						to_chat(user, "<span class='notice'>You dig a bit deeper. You're definitely halfway there now.</span>")
					if(6)
						to_chat(user, "<span class='notice'>You still have a ways to go.</span>")
					if(7)
						to_chat(user, "<span class='notice'>The hole looks pretty deep now.</span>")
					if(8)
						to_chat(user, "<span class='notice'>The ground is starting to feel a lot looser.</span>")
					if(9)
						to_chat(user, "<span class='notice'>You can almost see the other side.</span>")
					if(10)
						to_chat(user, "<span class='notice'>Just a little deeper...</span>")
					else
						if(is_type_in_typecache(W, pen_tools))
							to_chat(user, span("notice", "You penetrate the virgin earth!"))
						else
							to_chat(user, span("notice", "You shovel away some more sand."))
			else
				if(dug <= 10)
					to_chat(user, "<span class='notice'>You dig a little deeper.</span>")
				else
					to_chat(user, "<span class='notice'>You dug a big hole.</span>")

			gets_dug(user, is_type_in_typecache(W, pen_tools))
			digging = 0
			return

		to_chat(user, "<span class='warning'>You start digging.</span>")
		playsound(user.loc, 'sound/effects/stonedoor_openclose.ogg', 50, 1)

		digging = 1
		if(!do_after(user,40))
			if (istype(src, /turf/simulated/floor/planet))
				digging = 0
			return

		// Turfs are special. They don't delete. So we need to check if it's
		// still the same turf as before the sleep.
		if (!istype(src, /turf/simulated/floor/planet))
			return

		to_chat(user, "<span class='notice'> You dug a hole.</span>")
		digging = 0

		gets_dug(user, is_type_in_typecache(W, pen_tools))

	else if(istype(W,/obj/item/weapon/storage/bag/ore))
		var/obj/item/weapon/storage/bag/ore/S = W
		if(S.collection_mode)
			for(var/obj/item/weapon/ore/O in contents)
				O.attackby(W,user)
				return
	else if(istype(W,/obj/item/weapon/storage/bag/fossils))
		var/obj/item/weapon/storage/bag/fossils/S = W
		if(S.collection_mode)
			for(var/obj/item/weapon/fossil/F in contents)
				F.attackby(W,user)
				return

	else
		..(W,user)
	return

/turf/simulated/floor/planet/proc/gets_dug(mob/user, var/through = FALSE)

	add_overlay("asteroid_dug", TRUE)

	if(prob(75))
		new /obj/item/weapon/ore/glass(src)

	if(prob(25) && has_resources)
		var/list/ore = list()
		for(var/metal in resources)
			switch(metal)
				if("silicates")
					ore += /obj/item/weapon/ore/glass
				if("carbonaceous rock")
					ore += /obj/item/weapon/ore/coal
				if("iron")
					ore += /obj/item/weapon/ore/iron
				if("gold")
					ore += /obj/item/weapon/ore/gold
				if("silver")
					ore += /obj/item/weapon/ore/silver
				if("diamond")
					ore += /obj/item/weapon/ore/diamond
				if("uranium")
					ore += /obj/item/weapon/ore/uranium
				if("phoron")
					ore += /obj/item/weapon/ore/phoron
				if("osmium")
					ore += /obj/item/weapon/ore/osmium
				if("hydrogen")
					ore += /obj/item/weapon/ore/hydrogen
				else
					if(prob(25))
						switch(rand(1,5))
							if(1)
								ore += /obj/random/junk
							if(2)
								ore += /obj/random/powercell
							if(3)
								ore += /obj/random/coin
							if(4)
								ore += /obj/random/loot
							if(5)
								ore += /obj/item/weapon/ore/glass
					else
						ore += /obj/item/weapon/ore/glass
		if (ore.len)
			var/ore_path = pick(ore)
			if(ore)
				new ore_path(src)

	if(dug <= 10)
		dug += 1
		add_overlay("asteroid_dug", TRUE)
	else if(through)
		var/turf/below = GetBelow(src)
		if(below)
			var/area/below_area = below.loc		// Let's just assume that the turf is not in nullspace.
			if(below_area.station_area)
				if (user)
					to_chat(user, "<span class='alert'>You strike metal!</span>")
				below.spawn_roof(ROOF_FORCE_SPAWN)
			else
				ChangeTurf(/turf/simulated/open)

/turf/simulated/floor/planet/sand/rocky
	name = "rocky sand"
	icon = 'icons/turf/smooth/rocky_ash.dmi'
	icon_state = "rockyash"
	desc = "A fine grey ash. Seems to contain medium-sized rocks."
	footstep_sound = "gravelstep"

/turf/simulated/floor/planet/sand/rocky/Initialize()
	. = ..()
	if (prob(20))
		add_overlay("asteroid[rand(0, 9)]", TRUE)