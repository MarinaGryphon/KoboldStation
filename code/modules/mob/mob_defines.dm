/mob
	density = 1
	layer = 4.0
	animate_movement = 2
	flags = PROXMOVE
	sight = DEFAULT_SIGHT
	var/tmp/datum/mind/mind

	var/tmp/stat = 0 //Whether a mob is alive or dead. TODO: Move this to living - Nodrak

	var/tmp/obj/screen/flash = null
	var/tmp/obj/screen/blind = null
	var/tmp/obj/screen/hands = null
	var/tmp/obj/screen/pullin = null
	var/tmp/obj/screen/purged = null
	var/tmp/obj/screen/internals/internals = null
	var/tmp/obj/screen/oxygen = null
	var/tmp/obj/screen/i_select = null
	var/tmp/obj/screen/m_select = null
	var/tmp/obj/screen/toxin = null
	var/tmp/obj/screen/fire = null
	var/tmp/obj/screen/bodytemp = null
	var/tmp/obj/screen/healths = null
	var/tmp/obj/screen/throw_icon = null
	var/tmp/obj/screen/nutrition_icon = null
	var/tmp/obj/screen/hydration_icon = null
	var/tmp/obj/screen/pressure = null
	var/tmp/obj/screen/damageoverlay = null
	var/tmp/obj/screen/pain = null
	var/tmp/obj/screen/gun/item/item_use_icon = null
	var/tmp/obj/screen/gun/radio/radio_use_icon = null
	var/tmp/obj/screen/gun/move/gun_move_icon = null
	var/tmp/obj/screen/gun/run/gun_run_icon = null
	var/tmp/obj/screen/gun/mode/gun_setting_icon = null
	var/tmp/obj/screen/up_hint = null

	//spells hud icons - this interacts with add_spell and remove_spell
	var/tmp/list/obj/screen/movable/spell_master/spell_masters = null

	/*A bunch of this stuff really needs to go under their own defines instead of being globally attached to mob.
	A variable should only be globally attached to turfs/objects/whatever, when it is in fact needed as such.
	The current method unnecessarily clusters up the variable list, especially for humans (although rearranging won't really clean it up a lot but the difference will be noticable for other mobs).
	I'll make some notes on where certain variable defines should probably go.
	Changing this around would probably require a good look-over the pre-existing code.
	*/
	var/tmp/obj/screen/zone_sel/zone_sel = null

	var/tmp/use_me = 1 //Allows all mobs to use the me verb by default, will have to manually specify they cannot
	var/tmp/damageoverlaytemp = 0
	var/tmp/computer_id = null
	var/character_id = 0
	var/tmp/obj/machinery/machine = null
	var/tmp/other_mobs = null
	var/tmp/sdisabilities = 0	//Carbon
	var/tmp/disabilities = 0	//Carbon
	var/tmp/atom/movable/pulling = null
	var/tmp/next_move = null
	var/tmp/transforming = null	//Carbon
	var/tmp/other = 0.0
	var/tmp/hand = null
	var/tmp/eye_blind = null	//Carbon
	var/tmp/eye_blurry = null	//Carbon
	var/tmp/ear_deaf = null		//Carbon
	var/tmp/ear_damage = null	//Carbon
	var/tmp/stuttering = null
	var/tmp/slurring = null
	var/tmp/brokejaw = null
	var/tmp/tarded = null
	var/real_name = null
	var/tmp/flavor_text = ""
	var/tmp/med_record = ""
	var/tmp/sec_record = ""
	var/tmp/list/incidents = list()
	var/tmp/gen_record = ""
	var/tmp/ccia_record = ""
	var/tmp/list/ccia_actions = list()
	var/tmp/exploit_record = ""
	var/tmp/blinded = null
	var/tmp/bhunger = 0			//Carbon
	var/tmp/ajourn = 0
	var/tmp/druggy = 0			//Carbon
	var/tmp/confused = 0		//Carbon
	var/tmp/antitoxs = null
	var/tmp/phoron = null
	var/tmp/sleeping = 0		//Carbon
	var/tmp/resting = 0			//Carbon
	var/tmp/lying = 0
	var/tmp/lying_prev = 0
	var/tmp/canmove = 1
	//Allows mobs to move through dense areas without restriction. For instance, in space or out of holder objects.
	var/tmp/incorporeal_move = 0 //0 is off, 1 is normal, 2 is for ninjas.
	var/tmp/lastpuke = 0
	var/tmp/unacidable = 0
	var/tmp/list/pinned = list()            // List of things pinning this creature to walls (see living_defense.dm)
	var/tmp/list/embedded = list()          // Embedded items, since simple mobs don't have organs.
	var/tmp/list/languages = list()         // For speaking/listening.
	var/tmp/list/speak_emote = list("says") // Verbs used when speaking. Defaults to 'say' if speak_emote is null.
	var/emote_type = 1		// Define emote default type, 1 for seen emotes, 2 for heard emotes
	var/tmp/facing_dir = null   // Used for the ancient art of moonwalking.

	var/tmp/obj/machinery/hologram/holopad/holo = null

	var/tmp/name_archive //For admin things like possession

	var/tmp/timeofdeath = 0.0//Living
	var/tmp/cpr_time = 1.0//Carbon

	var/bodytemperature = 310.055	//98.7 F
	var/tmp/old_x = 0
	var/tmp/old_y = 0
	var/tmp/drowsyness = 0.0//Carbon
	var/tmp/charges = 0.0
	var/nutrition = BASE_MAX_NUTRITION * CREW_NUTRITION_SLIGHTLYHUNGRY  //carbon
	var/nutrition_loss = HUNGER_FACTOR //How much hunger is lost per tick. This is modified by species
	var/tmp/nutrition_attrition_rate = 1   // A multiplier for how much nutrition this specific mob loses per tick.
	var/max_nutrition = BASE_MAX_NUTRITION

	var/hydration = BASE_MAX_HYDRATION * CREW_HYDRATION_SLIGHTLYTHIRSTY //carbon
	var/hydration_loss = THIRST_FACTOR //How much hunger is lost per tick. This is modified by species
	var/tmp/hydration_attrition_rate = 1   // A multiplier for how much hydration this specific mob loses per tick.
	var/max_hydration = BASE_MAX_NUTRITION

	var/overeatduration = 0		// How long this guy is overeating //Carbon
	var/overdrinkduration = 0	// How long this guy is overdrinking //Carbon

	var/tmp/paralysis = 0.0
	var/tmp/stunned = 0.0
	var/tmp/weakened = 0.0
	var/tmp/losebreath = 0.0//Carbon
	var/tmp/intent = null//Living
	var/tmp/shakecamera = 0
	var/tmp/a_intent = I_HELP//Living
	var/tmp/m_intent = "walk"//Living
	var/lastKnownIP = null
	var/tmp/obj/buckled = null//Living
	var/obj/item/l_hand = null//Living
	var/obj/item/r_hand = null//Living
	var/obj/item/back = null//Human/Monkey
	var/obj/item/tank/internal = null//Human/Monkey
	var/obj/item/storage/s_active = null//Carbon
	var/obj/item/clothing/mask/wear_mask = null//Carbon

	var/tmp/datum/hud/hud_used = null

	var/tmp/list/grabbed_by = list(  )
	var/tmp/list/requests = list(  )

	var/tmp/list/mapobjs = list()

	var/tmp/in_throw_mode = 0

	var/tmp/inertia_dir = 0

	var/tmp/job = null//Living
	var/megavend = 0		//determines if this ID has claimed their megavend stache

	var/const/blindness = 1//Carbon
	var/const/deafness = 2//Carbon
	var/const/muteness = 4//Carbon

	var/tmp/can_pull_size = 10              // Maximum w_class the mob can pull.
	var/tmp/can_pull_mobs = MOB_PULL_LARGER // Whether or not the mob can pull other mobs.

	var/datum/dna/dna = null//Carbon

	var/tmp/list/mutations = list() //Carbon -- Doohl
	//see: setup.dm for list of mutations

	var/voice_name = "unidentifiable voice"

	var/faction = "neutral" //Used for checking whether hostile simple animals will attack you, possibly more stuff later
	var/tmp/captured = 0 //Functionally, should give the same effect as being buckled into a chair when true.

//Generic list for proc holders. Only way I can see to enable certain verbs/procs. Should be modified if needed.
	//var/proc_holder_list[] = list()//Right now unused.
	//Also unlike the spell list, this would only store the object in contents, not an object in itself.

	/* Add this line to whatever stat module you need in order to use the proc holder list.
	Unlike the object spell system, it's also possible to attach verb procs from these objects to right-click menus.
	This requires creating a verb for the object proc holder.

	if (proc_holder_list.len)//Generic list for proc_holder objects.
		for(var/obj/effect/proc_holder/P in proc_holder_list)
			statpanel("[P.panel]","",P)
	*/

//The last mob/living/carbon to push/drag/grab this mob (mostly used by slimes friend recognition)
// This is stored as a weakref because BYOND's harddeleter sucks ass.
	var/tmp/datum/weakref/LAssailant

//Wizard mode, but can be used in other modes thanks to the brand new "Give Spell" badmin button
	var/tmp/spell/list/spell_list

//List of active diseases

	var/tmp/list/viruses = list() // replaces var/datum/disease/virus

//Monkey/infected mode
	var/tmp/list/resistances = list()
	var/tmp/datum/disease/virus = null

	mouse_drag_pointer = MOUSE_ACTIVE_POINTER

	var/tmp/update_icon = 1 //Set to 1 to trigger update_icons() at the next life() call

	var/status_flags = CANSTUN|CANWEAKEN|CANPARALYSE|CANPUSH	//bitflags defining which status effects can be inflicted (replaces canweaken, canstun, etc)

	var/tmp/area/lastarea = null

	var/tmp/digitalcamo = 0 // Can they be tracked by the AI?

	var/tmp/obj/control_object //Used by admins to possess objects. All mobs should have this var

	//Whether or not mobs can understand other mobtypes. These stay in /mob so that ghosts can hear everything.
	var/universal_speak = 0 // Set to 1 to enable the mob to speak to everyone -- TLE
	var/universal_understand = 0 // Set to 1 to enable the mob to understand everyone, not necessarily speak

	//If set, indicates that the client "belonging" to this (clientless) mob is currently controlling some other mob
	//so don't treat them as being SSD even though their client var is null.
	var/tmp/mob/teleop = null

	var/tmp/turf/listed_turf = null  	//the current turf being examined in the stat panel
	var/tmp/list/shouldnt_see = list()	//typecache of objects that this mob shouldn't see in the stat panel. this silliness is needed because of AI alt+click and cult blood runes

	var/tmp/list/active_genes=list()
	var/mob_size = MOB_MEDIUM

	var/tmp/list/progressbars

	var/tmp/frozen = FALSE //related to wizard statues, if set to true, life won't process

	gfi_layer_rotation = GFI_ROTATION_DEFDIR
	var/tmp/disconnect_time = null//Time of client loss, set by Logout(), for timekeeping

	var/mob_thinks = TRUE

	var/tmp/authed = TRUE
	var/tmp/player_age = "Requires database"
