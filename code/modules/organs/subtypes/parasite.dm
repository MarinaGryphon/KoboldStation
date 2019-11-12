/obj/item/organ/parasite
	name = "parasite"
	icon = 'icons/mob/npc/alien.dmi'
	icon_state = "burst_lie"
	dead_icon = "bursted_lie"

	organ_tag = "parasite"
	var/stage = 1
	var/max_stage = 4
	var/stage_ticker = 0
	var/stage_interval = 600 //time between stages, in seconds
	var/subtle = 0 //will the body reject the parasite naturally?

/obj/item/organ/parasite/process()
	..()

	if(!owner)
		return

	if(stage < max_stage)
		stage_ticker += 2 //process ticks every ~2 seconds

	if(stage_ticker >= stage*stage_interval)
		stage = min(stage+1,max_stage)
		stage_effect()

/obj/item/organ/parasite/handle_rejection()
	if(subtle)
		return ..()
	else
		if(rejecting)
			rejecting = 0
		return

/obj/item/organ/parasite/proc/stage_effect()
	return

//////////////////////
///Zombie Infection///
//////////////////////

/obj/item/organ/parasite/zombie
	name = "black tumor"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "blacktumor"
	dead_icon = "blacktumor"

	organ_tag = "zombie"

	parent_organ = "chest"
	stage_interval = 150

/obj/item/organ/parasite/zombie/process()
	..()

	if (!owner)
		return

	if(prob(10) && (owner.can_feel_pain()))
		to_chat(owner, "<span class='warning'>You feel a burning sensation on your skin!</span>")
		owner.make_jittery(10)

	else if(prob(10))
		owner.emote("moan")

	if(stage >= 2)
		if(prob(15))
			owner.emote("scream")
			if(!isundead(owner))
				owner.adjustBrainLoss(2, 55)

		else if(prob(10))
			if(!isundead(owner))
				to_chat(owner, "<span class='warning'>You feel sick.</span>")
				owner.adjustToxLoss(5)
				owner.delayed_vomit()

	if(stage >= 3)
		if(prob(10))
			if(isundead(owner))
				owner.adjustBruteLoss(-30)
				owner.adjustFireLoss(-30)
			else
				to_chat(owner, "<span class='cult'>You feel an insatiable hunger.</span>")
				owner.nutrition = -1

	if(stage >= 4)
		if(prob(10))
			if(!isundead(owner))
				if(owner.species.zombie_type)
					var/r = owner.r_skin
					var/g = owner.g_skin
					var/b = owner.b_skin

					for(var/datum/language/L in owner.languages)
						owner.remove_language(L.name)
					to_chat(owner, "<span class='warning'>You feel life leaving your husk, but death rejects you...</span>")
					playsound(src.loc, 'sound/hallucinations/far_noise.ogg', 50, 1)
					to_chat(owner, "<font size='3'><span class='cult'>All that is left is a cruel hunger for the flesh of the living, and the desire to spread this infection. You must consume all the living!</font></span>")
					owner.set_species(owner.species.zombie_type, 0, 0, 0)
					owner.change_skin_color(r, g, b)
					owner.update_dna()
				else
					owner.adjustToxLoss(50)