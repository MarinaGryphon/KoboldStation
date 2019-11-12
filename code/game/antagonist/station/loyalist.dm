var/datum/antagonist/loyalists/loyalists

/datum/antagonist/loyalists
	id = MODE_LOYALIST
	role_text = "Head Loyalist"
	role_text_plural = "Loyalists"
	bantype = "loyalist"
	feedback_tag = "loyalist_objective"
	antag_indicator = "loyal_head"
	welcome_text = "You belong to the Company, body and soul. Preserve its interests against the conspirators amongst the crew."
	victory_text = "The heads of staff remained at their posts! The loyalists win!"
	loss_text = "The heads of staff did not stop the revolution!"
	victory_feedback_tag = "win - rev heads killed"
	loss_feedback_tag = "loss - heads killed"
	antaghud_indicator = "hudloyalist"
	flags = 0

	hard_cap = 2
	hard_cap_round = 4
	initial_spawn_req = 2
	initial_spawn_target = 4

	// Inround loyalists.
	faction_role_text = "Loyalist"
	faction_descriptor = "Company"
	faction_verb = /mob/living/proc/convert_to_loyalist
	faction_welcome = "Preserve NanoTrasen's interests against the traitorous recidivists amongst the crew. Protect the heads of staff with your life."
	faction_indicator = "loyal"
	faction_invisible = 1
	restricted_jobs = list("AI", "Cyborg")

/datum/antagonist/loyalists/New()
	..()
	loyalists = src

/datum/antagonist/loyalists/equip(var/mob/living/carbon/human/player)

	if(!..())
		return 0

	player.equip_to_slot_or_del(new /obj/item/device/announcer(player), slot_in_backpack)
	return 1
