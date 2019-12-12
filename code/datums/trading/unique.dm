/datum/trader/ship/unique
	trade_flags = TRADER_WANTED_ONLY|TRADER_GOODS
	want_multiplier = 5
	typical_duration = 10

/datum/trader/ship/unique/New()
	..()
	wanted_items = list()
	for(var/type in possible_wanted_items)
		var/status = possible_wanted_items[type]
		if(status & TRADER_THIS_TYPE)
			wanted_items += type
		if(status & TRADER_SUBTYPES_ONLY)
			wanted_items += subtypesof(type)
		if(status & TRADER_BLACKLIST)
			wanted_items -= type
		if(status & TRADER_BLACKLIST_SUB)
			wanted_items -= subtypesof(type)

/datum/trader/ship/unique/tick()
	if(prob(-disposition) || refuse_comms)
		duration_of_stay--
	return --duration_of_stay > 0

/datum/trader/ship/unique/what_do_you_want()
	return get_response("what_want", "I don't want anything!")

/datum/trader/ship/unique/syndicate
	name = "Cyndie Kate"
	origin = "Cloaked ship"

	possible_wanted_items = list (
		/obj/item/gun/energy/captain                 = TRADER_THIS_TYPE,
		/obj/item/hand_tele                          = TRADER_THIS_TYPE,
		/obj/item/blueprints                                = TRADER_THIS_TYPE,
		/obj/item/reagent_containers/hypospray       = TRADER_ALL,
		/obj/item/card/id/captains_spare             = TRADER_THIS_TYPE,
		/obj/item/gun/projectile/heavysniper/tranq   = TRADER_THIS_TYPE,
		/obj/item/stack/telecrystal                         = TRADER_THIS_TYPE,
		/obj/item/bluespace_crystal                         = TRADER_ALL,
		/obj/random/telecrystals                            = TRADER_THIS_TYPE,
		/obj/item/device/pin_extractor                      = TRADER_THIS_TYPE,
		/obj/item/circuitboard/aicore                = TRADER_THIS_TYPE,
		/obj/item/aiModule                           = TRADER_SUBTYPES_ONLY
	)

	possible_trading_items = list (
		/obj/item/antag_spawner/borg_tele            = TRADER_THIS_TYPE,
		/obj/item/storage/box/syndie_kit             = TRADER_SUBTYPES_ONLY,
		/obj/item/syndie/c4explosive                 = TRADER_ALL,
		/obj/item/melee/energy/sword                 = TRADER_ALL,
		/obj/item/melee/energy/sword/color           = TRADER_BLACKLIST,
		/obj/item/melee/energy/axe                   = TRADER_THIS_TYPE,
		/obj/item/shield/energy                      = TRADER_ALL,
		/obj/item/clothing/gloves/force/syndicate           = TRADER_THIS_TYPE,
		/obj/item/card/id/syndicate                  = TRADER_THIS_TYPE,
		/obj/item/rig/merc                           = TRADER_THIS_TYPE,
		/obj/item/rig/light/stealth                  = TRADER_THIS_TYPE,
		/obj/item/rig/light/hacker                   = TRADER_THIS_TYPE,
		/obj/item/gun/launcher/grenade               = TRADER_THIS_TYPE,
		/obj/item/gun/energy/sniperrifle             = TRADER_THIS_TYPE,
		/obj/item/gun/projectile/automatic           = TRADER_SUBTYPES_ONLY,
		/obj/mecha/combat/marauder/mauler                   = TRADER_THIS_TYPE,
		/obj/mecha/working/ripley/deathripley               = TRADER_THIS_TYPE
	)

	speech = list(
		"hail_generic"         = "Look, you can't afford the stuff I sell. You'll go get me valuable things from that station nearby, and I'll trade you my stuff. And you better do it fast, I think I might be tracked.",
		"hail_deny"            = "This is not worth my time.",
		"trade_complete"       = "Oooh, the commander will LOVE this!",
		"trade_no_money"       = "Don't waste my time!",
		"trade_not_enough"     = "Get me the good stuff I need or I'm gone!",
		"trade_found_unwanted" = "I need high value things, not this garbage!",
		"how_much"             = "I need VALUABLE things, and I need them FAST.",
		"what_want"            = "There's a station near you, go there, get some high value and classified things. Or crystals.",
		"compliment_deny"      = "Shove your compliments, I'm busy!",
		"compliment_accept"    = "I might just recommend you to my employers...",
		"insult_good"          = "Heh, you got style.",
		"insult_bad"           = "I'm marking you for a hit..."
	)

	mob_transfer_message = "<span class='danger'>You are transported to ORIGIN, and with a sickening thud, you fall unconscious, never to wake again.</span>"

/datum/trader/ship/unique/severance
	name = "Unknown"
	origin = "SGS Severance"

	possible_wanted_items = list(
		/obj/item/reagent_containers/food/snacks/human      = TRADER_SUBTYPES_ONLY,
		/obj/item/reagent_containers/food/snacks/meat/human = TRADER_THIS_TYPE,
		/mob/living/carbon/human                                   = TRADER_ALL
	)

	possible_trading_items = list(
		/obj/mecha/combat                               = TRADER_SUBTYPES_ONLY,
		/obj/mecha/combat/phazon                        = TRADER_BLACKLIST_ALL,
		/obj/mecha/combat/tank                          = TRADER_BLACKLIST_ALL,
		/obj/item/gun/projectile/automatic/rifle = TRADER_SUBTYPES_ONLY,
		/obj/item/gun/energy/pulse               = TRADER_ALL,
		/obj/item/gun/energy/rifle/pulse         = TRADER_THIS_TYPE
	)

	speech = list(
		"hail_generic"         = "H-hello. Can you hear me? G-good... I have... specific needs... I have a lot to t-trade with you in return, of course...",
		"hail_deny"            = "--CONNECTION SEVERED--",
		"trade_complete"       = "Hahahahahahaha! Thankyouthankyouthankyou!",
		"trade_no_money"       = "I d-don't NEED cash.",
		"trade_not_enough"     = "N-no, no no no. M-more than that... more...",
		"trade_found_unwanted" = "I d-don't think you GET what I want, from your offer.",
		"how_much"             = "Meat. I want meat. The kind they don't serve i-in the mess hall.",
		"what_want"            = "Long p-pork. Yes... that's what I want...",
		"compliment_deny"      = "Your lies won't c-change what I did.",
		"compliment_accept"    = "Yes... I suppose you're right.",
		"insult_good"          = "I... probably deserve that.",
		"insult_bad"           = "Maybe you should c-come here and say that. You'd be worth s-something then."
	)

	mob_transfer_message = "<span class='danger'>You are transported to ORIGIN, and with a sickening thud, you fall unconscious, never to wake again.</span>"

/datum/trader/ship/unique/bluespace
	name = "Maximus Crane"
	origin = "Bluespace Emporium"

	possible_wanted_items = list(
		/obj/item/bluespace_crystal                   = TRADER_ALL,
		/obj/machinery/bluespacerelay                 = TRADER_ALL,
		/obj/item/stack/telecrystal                   = TRADER_THIS_TYPE,
		/obj/item/organ/brain/golem                   = TRADER_THIS_TYPE,
		/obj/item/device/soulstone                    = TRADER_THIS_TYPE,
		/obj/item/circuitboard/telesci_console = TRADER_THIS_TYPE,
		/obj/item/circuitboard/telesci_pad     = TRADER_THIS_TYPE,
		/obj/item/phylactery                          = TRADER_THIS_TYPE,
		/obj/item/blueprints                          = TRADER_THIS_TYPE,
		/obj/item/storage/backpack/holding     = TRADER_THIS_TYPE,
		/obj/item/teleportation_scroll         = TRADER_THIS_TYPE
	)

	possible_trading_items = list(
		/obj/item/mecha_parts/chassis/phazon                 = TRADER_THIS_TYPE,
		/obj/item/mecha_parts/part/phazon_torso              = TRADER_THIS_TYPE,
		/obj/item/mecha_parts/part/phazon_head               = TRADER_THIS_TYPE,
		/obj/item/mecha_parts/part/phazon_left_arm           = TRADER_THIS_TYPE,
		/obj/item/mecha_parts/part/phazon_right_arm          = TRADER_THIS_TYPE,
		/obj/item/mecha_parts/part/phazon_left_leg           = TRADER_THIS_TYPE,
		/obj/item/mecha_parts/part/phazon_right_leg          = TRADER_THIS_TYPE
	)

	speech = list(
		"hail_generic"         = "I trade bluespace and bluespace accessories.",
		"hail_deny"            = "I have nothing to deal with you.",
		"trade_complete"       = "I am sure it is not going to malfuction!",
		"trade_no_money"       = "I don't need credits.",
		"trade_not_enough"     = "I will need far more than this.",
		"trade_found_unwanted" = "This is useless for me.",
		"trade_refuse"         = "Nope, bluespace is not so cheap.",
		"how_much"             = "Maybe for VALUE, bluespace is not cheap!",
		"what_want"            = "I want bluespace related items.",
		"compliment_deny"      = "Well, well.",
		"compliment_accept"    = "I know, the squirrel is great.",
		"insult_good"          = "Witty.",
		"insult_bad"           = "And you still want to do business?"
	)
