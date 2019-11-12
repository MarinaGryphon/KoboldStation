/obj/item/weapon/storage/field_ration
	name = "field ration"
	desc = "An individually packed meal, designated to be consumed on field."
	icon = 'icons/obj/storage.dmi'
	icon_state = "ration"
	var/preset_ration	//if the package comes with one in particular, not a random

/obj/item/weapon/storage/field_ration/fill()
	..()
	new /obj/item/weapon/material/kitchen/utensil/spoon(src)
	create_ration()
	make_exact_fit()

/obj/item/weapon/storage/field_ration/proc/create_ration()
	var/selected_ration = preset_ration
	if(!selected_ration)
		selected_ration = pick("LoamCorp Sponsored")

	switch(selected_ration)

		if("LoamCorp Sponsored")
			new /obj/item/weapon/reagent_containers/food/snacks/liquidfood(src)
			new /obj/item/weapon/reagent_containers/food/snacks/liquidfood(src)
			new /obj/item/weapon/reagent_containers/food/drinks/cans/sodawater(src)
			desc += " This one has the LoamCorp logo."

/obj/item/weapon/storage/field_ration/loamcorp
	preset_ration = "LoamCorp Sponsored"