/mob/living
	see_in_dark = 2
	see_invisible = SEE_INVISIBLE_LIVING

	//Health and life related vars
	var/maxHealth = 100 //Maximum health that should be possible.
	var/health = 100 	//A mob's health

	var/tmp/hud_updateflag = 0


	var/tmp/hallucination = 0 //Directly affects how long a mob will hallucinate for
	var/tmp/list/atom/hallucinations = list() //A list of hallucinated people that try to attack the mob. See /obj/effect/fake_attacker in hallucinations.dm

	var/tmp/last_special = 0 //Used by the resist verb, likely used to prevent players from bypassing next_move by logging in/out.

	var/tmp/t_phoron = null
	var/tmp/t_oxygen = null
	var/tmp/t_sl_gas = null
	var/tmp/t_n2 = null

	var/tmp/now_pushing = null
	var/mob_bump_flag = 0
	var/mob_swap_flags = 0
	var/mob_push_flags = 0
	var/mob_always_swap = 0

	var/tmp/mob/living/cameraFollow = null
	var/tmp/list/datum/action/actions = list()

	var/tmp/tod = null // Time of death
	var/tmp/update_slimes = 1
	var/tmp/silent = null 		// Can't talk. Value goes down every life proc.
	var/tmp/on_fire = 0 //The "Are we on fire?" var
	var/tmp/fire_stacks = 0
	var/tmp/footstep = 0

	var/tmp/failed_last_breath = 0 //This is used to determine if the mob failed a breath. If they did fail a brath, they will attempt to breathe each tick, otherwise just once per 4 ticks.
	var/tmp/possession_candidate // Can be possessed by ghosts if unplayed.

	var/tmp/list/stomach_contents	//This is moved here from carbon defines
	var/composition_reagent
	var/composition_reagent_quantity
	var/mouth_size = 2//how large of a creature it can swallow at once, and how big of a bite it can take out of larger things
	var/tmp/eat_types = 0//This is a bitfield which must be initialised in New(). The valid values for it are in devour.dm
	var/tmp/underdoor //Used for mobs that can walk through maintenance hatches - drones and spiderbots
	var/tmp/life_tick = 0      // The amount of life ticks that have processed on this mob.


	//These values are duplicated from the species datum so we can handle things on a per-mob basis, allows for chemicals to affect them
	var/tmp/stamina = 0
	var/tmp/max_stamina = 100//Maximum stamina. We start taking oxyloss when this runs out while sprinting
	var/tmp/sprint_speed_factor = 0.4
	var/tmp/sprint_cost_factor = 1
	var/tmp/stamina_recovery = 1
	var/tmp/min_walk_delay = 0//When move intent is walk, movedelay is clamped to this value as a lower bound
	var/tmp/exhaust_threshold = 50
	var/tmp/datum/progressbar/stamina_bar	// Progress bar shown when stamina is not at full, and the mob supports stamina. Deleted on Logout or when stamina is full.

	var/tmp/move_delay_mod = 0//Added to move delay, used for calculating movement speeds. Provides a centralised value for modifiers to alter

	var/tmp/total_radiation	// DON'T MODIFY THIS DIRECTLY. USE apply_radiation()!
	var/tmp/cloaked = 0//Set to 1 by cloaking devices, optimises update_icons

	var/tmp/tesla_ignore = 0	// If true, mob is not affected by tesla bolts.

	var/tmp/stop_sight_update = 0 //If true, it won't reset the mob vision flags

	var/tmp/burn_mod = 1
	var/tmp/brute_mod = 1

	var/tmp/limb_breaking = FALSE // used to limit people from queuing up limb-breaks
