/mob/living/carbon/
	gender = MALE
	var/tmp/datum/species/species //Contains icon generation and language information, set during New().
	//stomach contents redefined at mob/living level, removed from here
	var/tmp/list/datum/disease2/disease/virus2 = list()
	var/tmp/list/antibodies = list()

	var/tmp/analgesic = 0 // when this is set, the mob isn't affected by shock or pain
					  // life should decrease this by 1 every tick
	// total amount of wounds on mob, used to spread out healing and the like over all wounds
	var/tmp/number_wounds = 0
	var/tmp/obj/item/handcuffed = null //Whether or not the mob is handcuffed
	var/tmp/obj/item/legcuffed = null  //Same as handcuffs but for legs. Bear traps use this.
	//Surgery info
	var/tmp/datum/surgery_status/op_stage = new/datum/surgery_status
	//Active emote/pose
	var/tmp/pose = null
	var/tmp/list/chem_effects = list()
	var/intoxication = 0//Units of alcohol in their system
	var/tmp/datum/reagents/metabolism/bloodstr = null
	var/tmp/datum/reagents/metabolism/touching = null
	var/tmp/datum/reagents/metabolism/breathing = null

	var/tmp/pulse = PULSE_NORM	//current pulse level

	//these two help govern taste. The first is the last time a taste message was shown to the plaer.
	//the second is the message in question.
	var/tmp/last_taste_time = 0
	var/tmp/last_taste_text = ""

	var/tmp/last_smell_time = 0
	var/tmp/last_smell_text = ""

	var/tmp/coughedtime = null // should only be useful for carbons as the only thing using it has a carbon arg.

	var/tmp/willfully_sleeping = 0
	var/consume_nutrition_from_air = FALSE // used by Diona