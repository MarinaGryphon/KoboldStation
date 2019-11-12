/mob/living/carbon/human/dummy
	real_name = "Test Dummy"
	status_flags = GODMODE|CANPUSH

/mob/living/carbon/human/dummy/mannequin
	mob_thinks = FALSE

INITIALIZE_IMMEDIATE(/mob/living/carbon/human/dummy/mannequin)

/mob/living/carbon/human/dummy/mannequin/Initialize()
	. = ..()
	mob_list -= src
	living_mob_list -= src
	dead_mob_list -= src
	human_mob_list -= src
	delete_inventory()

/mob/living/carbon/human/unathi/Initialize(mapload)
	h_style = "Unathi Horns"
	. = ..(mapload, "Unathi")

/mob/living/carbon/human/human/Initialize(mapload)
	. = ..(mapload, "Human")

/mob/living/carbon/human/machine/Initialize(mapload)
	h_style = "blue IPC screen"
	. = ..(mapload, "Baseline Frame")

/mob/living/carbon/human/golem/Initialize(mapload)
	. = ..(mapload, "Coal Golem")

/mob/living/carbon/human/iron_golem/Initialize(mapload)
	. = ..(mapload, "Iron Golem")

/mob/living/carbon/human/bronze_golem/Initialize(mapload)
	. = ..(mapload, "Bronze Golem")

/mob/living/carbon/human/steel_golem/Initialize(mapload)
	. = ..(mapload, "Steel Golem")

/mob/living/carbon/human/plasteel_golem/Initialize(mapload)
	. = ..(mapload, "Plasteel Golem")

/mob/living/carbon/human/titanium_golem/Initialize(mapload)
	. = ..(mapload, "Titanium Golem")

/mob/living/carbon/human/cloth_golem/Initialize(mapload)
	. = ..(mapload, "Cloth Golem")

/mob/living/carbon/human/cardboard_golem/Initialize(mapload)
	. = ..(mapload, "Cardboard Golem")

/mob/living/carbon/human/glass_golem/Initialize(mapload)
	. = ..(mapload, "Glass Golem")

/mob/living/carbon/human/phoron_golem/Initialize(mapload)
	. = ..(mapload, "Phoron Golem")

/mob/living/carbon/human/mhydrogen_golem/Initialize(mapload)
	. = ..(mapload, "Metallic Hydrogen Golem")

/mob/living/carbon/human/wood_golem/Initialize(mapload)
	. = ..(mapload, "Wood Golem")

/mob/living/carbon/human/diamond_golem/Initialize(mapload)
	. = ..(mapload, "Diamond Golem")

/mob/living/carbon/human/sand_golem/Initialize(mapload)
	. = ..(mapload, "Sand Golem")

/mob/living/carbon/human/uranium_golem/Initialize(mapload)
	. = ..(mapload, "Uranium Golem")

/mob/living/carbon/human/homunculus/Initialize(mapload)
	. = ..(mapload, "Homunculus")

/mob/living/carbon/human/adamantine_golem/Initialize(mapload)
	. = ..(mapload, "Adamantine Golem")