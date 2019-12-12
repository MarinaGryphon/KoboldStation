/datum/trader/ship/replica_shop
	name = "Replica Store Owner"
	name_language = TRADER_DEFAULT_NAME
	origin = "Replica Store"
	possible_origins = list("Ye-Old Armory", "Knights and Knaves", "The Blacksmith", "Historical Human Apparel and Items", "The Pointy End")
	speech = list(
		"hail_generic"      = "Welcome, welcome! You look like a man who appreciates human history. Come in, and learn! Maybe even.... buy?",
		"hail_Lizard"       = "Ah, you look like a lizard who knows his way around martial combat. Come in! Our stuff may not be as high quality as you are used to, but feel free to look around.",
		"hail_deny"         = "A man who does not appreciate history does not appreciate me. Goodbye.",
		"trade_complete"    = "Now remember, these may be replicas, but they are still a bit sharp!",
		"trade_blacklist"   = "No, I don't deal in that.",
		"trade_not_enough"  = "Hm. Well, I need more money than that.",
		"how_much"          = "This fine piece of craftsmanship costs about VALUE credits.",
		"what_want"         = "I want",
		"compliment_deny"   = "Oh ho ho! Aren't you quite the jester.",
		"compliment_accept" = "Hard to tell, isn't it? I make them all myself.",
		"insult_good"       = "They aren't JUST replicas!",
		"insult_bad"        = "Well, I'll never!",
		"bribe_refusal"     = "Well. I'd love to stay, but I've got an Unathi client somewhere else, and they are not known for patience.",
		"bribe_accept"      = "Sure, I'll stay a bit longer. Just for you, though."
	)

	possible_trading_items = list(
		/obj/item/clothing/head/wizard/magus            = TRADER_THIS_TYPE,
		/obj/item/shield/buckler                 = TRADER_THIS_TYPE,
		/obj/item/clothing/head/redcoat                 = TRADER_THIS_TYPE,
		/obj/item/clothing/head/powdered_wig            = TRADER_THIS_TYPE,
		/obj/item/clothing/head/hasturhood              = TRADER_THIS_TYPE,
		/obj/item/clothing/head/helmet/gladiator        = TRADER_THIS_TYPE,
		/obj/item/clothing/head/plaguedoctorhat         = TRADER_THIS_TYPE,
		/obj/item/clothing/head/helmet/unathi           = TRADER_THIS_TYPE,
		/obj/item/clothing/head/helmet/tank             = TRADER_ALL,
		/obj/item/clothing/head/helmet/tajara           = TRADER_THIS_TYPE,
		/obj/item/clothing/glasses/monocle              = TRADER_THIS_TYPE,
		/obj/item/clothing/mask/smokable/pipe           = TRADER_THIS_TYPE,
		/obj/item/clothing/mask/gas/plaguedoctor        = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/hastur                  = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/imperium_monk           = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/judgerobe               = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/wizrobe/magusred        = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/wizrobe/magusblue       = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/armor/unathi            = TRADER_THIS_TYPE,
		/obj/item/clothing/suit/armor/tajara            = TRADER_THIS_TYPE,
		/obj/item/clothing/under/gladiator              = TRADER_THIS_TYPE,
		/obj/item/clothing/under/kilt                   = TRADER_THIS_TYPE,
		/obj/item/clothing/under/redcoat                = TRADER_THIS_TYPE,
		/obj/item/clothing/under/soviet                 = TRADER_THIS_TYPE,
		/obj/item/material/harpoon               = TRADER_THIS_TYPE,
		/obj/item/material/sword                 = TRADER_ALL,
		/obj/item/material/scythe                = TRADER_THIS_TYPE,
		/obj/item/material/star                  = TRADER_THIS_TYPE,
		/obj/item/material/twohanded/baseballbat = TRADER_THIS_TYPE,
		/obj/item/material/twohanded/pike        = TRADER_ALL,
		/obj/item/material/twohanded/zweihander  = TRADER_THIS_TYPE,
		/obj/item/melee/whip                     = TRADER_THIS_TYPE
	)


/datum/trader/ship/hardsuit
	name = "Azazi Guild Seller"
	name_language = LANGUAGE_LIZARD
	origin = "Azazi Bulk Supply Guild"
	possible_trading_items = list(
		/obj/item/rig/unathi                    = TRADER_ALL,
		/obj/item/rig/internalaffairs           = TRADER_THIS_TYPE,
		/obj/item/rig/industrial                = TRADER_THIS_TYPE,
		/obj/item/rig/eva                       = TRADER_THIS_TYPE,
		/obj/item/rig/ce                        = TRADER_THIS_TYPE,
		/obj/item/rig/hazmat                    = TRADER_THIS_TYPE,
		/obj/item/rig/medical                   = TRADER_THIS_TYPE,
		/obj/item/rig/hazard                    = TRADER_THIS_TYPE,
		/obj/item/rig/combat                    = TRADER_THIS_TYPE,
		/obj/item/rig_module/device/healthscanner      = TRADER_THIS_TYPE,
		/obj/item/rig_module/device/drill              = TRADER_THIS_TYPE,
		/obj/item/rig_module/device/rfd_c              = TRADER_THIS_TYPE,
		/obj/item/rig_module/chem_dispenser            = TRADER_ALL,
		/obj/item/rig_module/voice                     = TRADER_THIS_TYPE,
		/obj/item/rig_module/vision                    = TRADER_SUBTYPES_ONLY,
		/obj/item/rig_module/ai_container              = TRADER_THIS_TYPE,
		/obj/item/rig_module/mounted                   = TRADER_SUBTYPES_ONLY

	)

	speech = list(
		"hail_generic"      = "Welcome to the Azazi Bulk Sssupply Guild! We sssupply in bulk!",
		"hail_Lizard"       = "Hello fellow Sinta! We have many fine wares that will bring you a sense of home in this alien system.",
		"hail_deny"         = "Go away, Guwan.",
		"trade_complete"    = "Ah, excellent.",
		"trade_blacklist"   = "I will pretend I didn't ssssee that.",
		"trade_no_goods"    = "You gotta buy the robots, sir. I don't do trades.",
		"trade_not_enough"  = "I can't go any lower. Pay in full.",
		"how_much"          = "Ah! Thisss isss only VALUE creditssss.",
		"compliment_deny"   = "Were it not for the lawsss of thisss land I would sslay you.",
		"compliment_accept" = "Ancestors blessss you.",
		"insult_good"       = "Ha! You have a fierce ssspirit, I like that.",
		"insult_bad"        = "Were you never taught to resspect your eldersss?",
		"bribe_refusal"     = "Do not try to dissshonor me again.",
		"bribe_accept"      = "Very well. I will ssstay for a bit longer."
	)
