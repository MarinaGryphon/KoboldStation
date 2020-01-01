// Mask
/datum/gear/mask
/datum/gear/mask/respirator
	display_name = "respirator"
	path = /obj/item/clothing/mask/gas/alt/respirator
	cost = 0 

/datum/gear/mask/dust
	display_name = "dust mask selection"
	path = /obj/item/clothing/mask/surgical

/datum/gear/mask/dust/New()
	..()
	var/masks = list()
	masks["dust mask"] = /obj/item/clothing/mask/surgical
	masks["dust mask, white"] = /obj/item/clothing/mask/surgical/w
	gear_tweaks += new/datum/gear_tweak/path(masks)

/datum/gear/mask/cloth
	display_name = "cloth mask"
	path = /obj/item/clothing/mask/cloth

/datum/gear/mask/cloth/New()
	..()
	gear_tweaks += gear_tweak_free_color_choice