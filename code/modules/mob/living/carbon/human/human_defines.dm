/mob/living/carbon/human
	//Hair colour and style
	var/r_hair = 0
	var/g_hair = 0
	var/b_hair = 0
	var/h_style = "Bald"

	//Facial hair colour and style
	var/r_facial = 0
	var/g_facial = 0
	var/b_facial = 0
	var/f_style = "Shaved"

	//Eye colour
	var/r_eyes = 0
	var/g_eyes = 0
	var/b_eyes = 0

	var/s_tone = 0	//Skin tone

	//Skin colour
	var/r_skin = 0
	var/g_skin = 0
	var/b_skin = 0

	var/size_multiplier_x = 1 //multiplier for the mob's icon x size
	var/size_multiplier_y = 1 //multiplier for the mob's icon y size
	var/damage_multiplier = 1 //multiplies melee combat damage
	var/icon_update = 1 //whether icon updating shall take place

	var/lip_style = null	//no lipstick by default- arguably misleading, as it could be used for general makeup

	var/age = 30		//Player's age (pure fluff)
	var/b_type = "A+"	//Player's bloodtype

	var/underwear = 1	//Which underwear the player wants
	var/undershirt = 0	//Which undershirt the player wants.
	var/socks = 0		//Which socks the player wants.
	var/backbag = 2		//Which backpack type the player has chosen. Nothing, Satchel or Backpack.
	var/backbag_style = 1

	var/tmp/last_chew = 0 // Used for hand chewing

	// General information
	var/citizenship = ""
	var/employer_faction = ""
	var/religion = ""

	//Equipment slots
	var/obj/item/wear_suit = null
	var/obj/item/w_uniform = null
	var/obj/item/shoes = null
	var/obj/item/belt = null
	var/obj/item/gloves = null
	var/obj/item/glasses = null
	var/obj/item/head = null
	var/obj/item/l_ear = null
	var/obj/item/r_ear = null
	var/obj/item/wear_id = null
	var/obj/item/r_store = null
	var/obj/item/l_store = null
	var/obj/item/s_store = null

	var/used_skillpoints = 0
	var/skill_specialization = null
	var/list/skills = list()

	var/tmp/icon/stand_icon = null
	var/tmp/icon/lying_icon = null

	var/tmp/voice = ""	//Instead of new say code calling GetVoice() over and over and over, we're just going to ask this variable, which gets updated in Life()

	var/tmp/speech_problem_flag = 0

	var/tmp/miming = null //Toggle for the mime's abilities.
	var/tmp/special_voice = "" // For changing our voice. Used by a symptom.

	var/tmp/last_dam = -1	//Used for determining if we need to process all organs or just some or even none.
	var/tmp/list/bad_external_organs = list()// organs we check until they are good.

	var/tmp/list/bad_internal_organs = list()//A list of internal organs which are damaged.
	//This isnt used for regular processing, since all internal organs are regularly processed anyway, but it can be used as a shortlist for calls that only care about damaged organs

	var/tmp/xylophone = 0 //For the spoooooooky xylophone cooldown

	var/tmp/mob/remoteview_target = null
	var/tmp/hand_blood_color

	var/list/flavor_texts = list()
	var/tmp/gunshot_residue
	var/tmp/pulling_punches // Are you trying not to hurt your opponent?

	mob_bump_flag = HUMAN
	mob_push_flags = ~HEAVY
	mob_swap_flags = ~HEAVY

	var/tmp/flash_protection = 0				// Total level of flash protection
	var/tmp/equipment_tint_total = 0			// Total level of visualy impairing items
	var/tmp/equipment_darkness_modifier			// Darkvision modifier from equipped items
	var/tmp/equipment_vision_flags				// Extra vision flags from equipped items
	var/tmp/equipment_see_invis					// Max see invibility level granted by equipped items
	var/tmp/equipment_prescription				// Eye prescription granted by equipped items
	var/tmp/list/equipment_overlays = list()	// Extra overlays from equipped items

	var/tmp/is_noisy = FALSE		// if TRUE, movement should make sound.
	var/tmp/last_x = 0
	var/tmp/last_y = 0

	var/tmp/cached_bodytype

	var/tmp/stance_damage = 0 //Whether this mob's ability to stand has been affected

	var/datum/unarmed_attack/default_attack	//default unarmed attack
