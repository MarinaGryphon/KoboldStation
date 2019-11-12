var/datum/antagonist/wizard/wizards

/datum/antagonist/wizard
	id = MODE_WIZARD
	role_text = "Space Wizard"
	role_text_plural = "Space Wizards"
	bantype = "wizard"
	landmark_id = "wizard"
	welcome_text = "You will find a list of available spells in your spell book. Choose your magic arsenal carefully.<br>In your pockets you will find a teleport scroll. Use it as needed."
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_VOTABLE | ANTAG_SET_APPEARANCE
	antaghud_indicator = "hudwizard"

	hard_cap = 1
	hard_cap_round = 3
	initial_spawn_req = 1
	initial_spawn_target = 1

	faction = "Space Wizard"

/datum/antagonist/wizard/New()
	..()
	wizards = src

/datum/antagonist/wizard/update_antag_mob(var/datum/mind/wizard)
	..()
	wizard.store_memory("<B>Remember:</B> do not forget to prepare your spells.")
	wizard.current.real_name = "[pick(wizard_first)] [pick(wizard_second)]"
	wizard.current.name = wizard.current.real_name

/datum/antagonist/wizard/equip(var/mob/living/carbon/human/player)

	if(!..())
		return FALSE

	for (var/obj/item/I in player)
		if (istype(I, /obj/item/implant))
			continue
		player.drop_from_inventory(I)
		if(I.loc != player)
			qdel(I)

	player.preEquipOutfit(/datum/outfit/admin/wizard, FALSE)
	player.equipOutfit(/datum/outfit/admin/wizard, FALSE)
	player.force_update_limbs()
	player.update_eyes()
	player.regenerate_icons()

/datum/antagonist/wizard/print_player_summary()
	..()
	for(var/p in current_antagonists)
		var/datum/mind/player = p
		var/text = "<b>[player.name]'s spells were:</b>"
		if(!player.learned_spells || !player.learned_spells.len)
			text += "<br>None!"
		else
			for(var/s in player.learned_spells)
				var/spell/spell = s
				text += "<br><b>[spell.name]</b> - "
				text += "Speed: [spell.spell_levels["speed"]] Power: [spell.spell_levels["power"]]"
		if(player.ambitions)
			text += "<br><font color='purple'><b>Their goals for today were:</b></font>"
			text += "<br>  '[player.ambitions]'"
		text += "<br>"
		to_world(text)


//To batch-remove wizard spells. Linked to mind.dm.
/mob/proc/spellremove()
	for(var/spell/spell_to_remove in src.spell_list)
		remove_spell(spell_to_remove)

obj/item/clothing
	var/wizard_garb = 0

// Does this clothing slot count as wizard garb? (Combines a few checks)
/proc/is_wiz_garb(var/obj/item/clothing/C)
	return C && C.wizard_garb

/*Checks if the wizard is wearing the proper attire.
Made a proc so this is not repeated 14 (or more) times.*/
/mob/proc/wearing_wiz_garb()
	to_chat(src, "Silly creature, you're not a human. Only humans can cast this spell.")
	return 0

// Humans can wear clothes.
/mob/living/carbon/human/wearing_wiz_garb()
	if(!is_wiz_garb(src.wear_suit) && (!src.species.hud || (slot_wear_suit in src.species.hud.equip_slots)))
		to_chat(src, "<span class='warning'>I don't feel strong enough without my robes.</span>")
		return 0
	if(!is_wiz_garb(src.head) && (!species.hud || (slot_head in src.species.hud.equip_slots)))
		to_chat(src, "<span class='warning'>I don't feel strong enough without my headwear.</span>")
		return 0
	return 1
