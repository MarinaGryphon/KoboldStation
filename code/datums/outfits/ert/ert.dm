//Mercenary
/datum/outfit/admin/ert/mercenary
	name = "Mercenary Freelancer"

	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/swat/ert
	gloves = /obj/item/clothing/gloves/swat/ert
	belt = /obj/item/storage/belt/military
	back = /obj/item/storage/backpack/satchel_norm
	l_hand = /obj/item/clothing/suit/space/void/freelancer
	r_hand = /obj/item/clothing/head/helmet/space/void/freelancer
	accessory = /obj/item/clothing/accessory/storage/black_vest
	id = /obj/item/card/id/syndicate

	l_ear = /obj/item/device/radio/headset/distress

	backpack_contents = list(
		/obj/item/gun/projectile/automatic/c20r = 1,
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/tank/oxygen = 1,
		/obj/item/clothing/gloves/yellow = 1,
		/obj/item/material/knife/trench = 1
	)

	belt_contents = list(
		/obj/item/ammo_magazine/a10mm = 3,
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/shield/energy = 1
	)

/datum/outfit/admin/ert/mercenary/get_id_access()
	return get_distress_access()

/datum/outfit/admin/ert/mercenary/specialist
	name = "Mercenary Freelancer Medic"

	belt = /obj/item/storage/belt/medical
	gloves = /obj/item/clothing/gloves/latex

	backpack_contents = list(
		/obj/item/gun/projectile/automatic/c20r = 1,
		/obj/item/ammo_magazine/a10mm = 2,
		/obj/item/storage/firstaid/combat = 1,
		/obj/item/storage/firstaid/adv = 1,
		/obj/item/tank/oxygen = 1
	)

	belt_contents = list(
		/obj/item/reagent_containers/hypospray = 1,
		/obj/item/stack/medical/advanced/bruise_pack = 1,
		/obj/item/stack/medical/advanced/ointment = 1,
		/obj/item/reagent_containers/glass/bottle/thetamycin = 1
	)

/datum/outfit/admin/ert/mercenary/leader
	name = "Mercenary Freelancer Leader"
	l_hand = /obj/item/gun/projectile/automatic/rifle/sts35
	r_hand = null
	back = /obj/item/rig/merc/distress
	suit_store = null
	suit = null
	head = null

	backpack_contents = list()

	belt_contents = list(
		/obj/item/ammo_magazine/c762 = 3,
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/shield/energy = 1
	)

// Deathsquads -- Admin Spawn Only
/datum/outfit/admin/deathsquad
	name = "Asset Protection"

	uniform = /obj/item/clothing/under/ert
	back = null
	belt = /obj/item/storage/belt/security/tactical
	shoes = null
	gloves = null
	mask = /obj/item/clothing/mask/gas/swat
	l_ear = /obj/item/device/radio/headset/ert
	glasses = /obj/item/clothing/glasses/sunglasses/sechud/tactical
	id = /obj/item/card/id/asset_protection
	l_pocket = /obj/item/plastique
	r_pocket = /obj/item/melee/energy/sword
	l_hand = /obj/item/gun/energy/rifle/pulse

	belt_contents = list(
		/obj/item/ammo_magazine/a454 = 2,
		/obj/item/melee/baton/loaded = 1,
		/obj/item/shield/energy = 1,
		/obj/item/grenade/flashbang = 2,
		/obj/item/handcuffs = 2,
		/obj/item/grenade/frag = 1
	)

	var/syndie = FALSE

/datum/outfit/admin/deathsquad/leader
	name = "Asset Protection Lead"

/datum/outfit/admin/deathsquad/syndicate
	name = "Syndicate Commando"

	uniform = /obj/item/clothing/under/syndicate
	belt = /obj/item/storage/belt/military/syndicate
	mask = /obj/item/clothing/mask/gas/syndicate
	l_ear = /obj/item/device/radio/headset/syndicate
	glasses = /obj/item/clothing/glasses/thermal
	id = /obj/item/card/id/syndicate_ert
	l_pocket = /obj/item/ammo_magazine/c45m
	l_hand = /obj/item/gun/projectile/automatic/rifle/sts35

	belt_contents = list(
		/obj/item/ammo_magazine/c762 = 3,
		/obj/item/shield/energy = 1,
		/obj/item/handcuffs = 1,
		/obj/item/grenade/flashbang = 1,
		/obj/item/grenade/frag = 1,
		/obj/item/plastique = 1
	)

	syndie = TRUE

/datum/outfit/admin/deathsquad/syndicate/leader
	name = "Syndicate Commando Lead"

/datum/outfit/admin/deathsquad/get_id_access()
	return get_all_accesses()

/datum/outfit/admin/deathsquad/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	var/obj/item/clothing/accessory/holster/armpit/hold = new(H)
	var/obj/item/gun/projectile/weapon


	if(syndie)
		weapon = new /obj/item/gun/projectile/silenced(H)
	else
		weapon = new /obj/item/gun/projectile/revolver/mateba(H)

	if(weapon)
		hold.contents += weapon
		hold.holstered = weapon

	var/obj/item/clothing/under/U = H.get_equipped_item(slot_w_uniform)
	U.attackby(hold, H)

	var/obj/item/rig/mercrig

	if(syndie)
		mercrig = new /obj/item/rig/merc(get_turf(H))
	else
		mercrig = new /obj/item/rig/ert/assetprotection(get_turf(H))

	if(mercrig)
		H.put_in_hands(mercrig)
		H.equip_to_slot_or_del(mercrig, slot_back)
		addtimer(CALLBACK(mercrig, /obj/item/rig/.proc/toggle_seals, H, TRUE), 2 SECONDS)