/datum/ghostspawner/human/ert
	tags = list("Response Teams")

	enabled = FALSE
	req_perms = null
	max_count = 5

	spawnpoints = list("ERTSpawn")

	//Vars related to human mobs
	possible_species = list("Human", "Skrell", "Tajara", "M'sai Tajara", "Unathi", "Baseline Frame")
	possible_genders = list(MALE,FEMALE)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Emergency Responder"
	special_role = "Emergency Responder"
	respawn_flag = null

	mob_name_pick_message = "Pick a callsign or last-name."

	mob_name = null

/datum/ghostspawner/human/ert/post_spawn(mob/user)
	if(name)
		to_chat(user, "<span class='danger'><font size=3>You are [max_count > 1 ? "a" : "the"] [name]!</font></span>")
	return ..()

//Mercenary ERT
/datum/ghostspawner/human/ert/mercenary
	name = "Mercenary Responder"
	short_name = "mercr"
	max_count = 2
	desc = "Rank and file of a freelancer mercenary team."
	welcome_message = "You're part of a freelancing mercenary team who just picked up a distress beacon coming from the Aurora. You have no affiliation to anyone, but you sure do want a quick buck."
	outfit = /datum/outfit/admin/ert/mercenary
	possible_species = list("Human", "Off-Worlder Human", "Tajara", "M'sai Tajara", "Zhan-Khazan Tajara", "Skrell", "Diona", "Unathi", "Vaurca Warrior", "Vaurca Worker", "Baseline Frame", "Hephaestus G1 Industrial Frame", "Hephaestus G2 Industrial Frame", "Xion Industrial Frame", "Zeng-Hu Mobility Frame", "Bishop Accessory Frame", "Shell Frame")

/datum/ghostspawner/human/ert/mercenary/specialist
	name = "Mercenary Medical Specialist"
	short_name = "mercs"
	max_count = 1
	desc = "The only medic of the freelancer mercenary team."
	outfit = /datum/outfit/admin/ert/mercenary/specialist

/datum/ghostspawner/human/ert/mercenary/leader
	name = "Mercenary Leader"
	short_name = "mercl"
	max_count = 1
	desc = "The leader of the freelancer mercenary team."
	outfit = /datum/outfit/admin/ert/mercenary/leader

// Deathsquads, spawn via admin intervention only.

/datum/ghostspawner/human/ert/deathsquad
	name = "NT Asset Protection Specialist"
	short_name = "ntaps"
	max_count = 3
	desc = "Protectors of NanoTrasen's bottom line. The last thing you never see."
	welcome_message = "The NSS Aurora has been compromised. Recover NanoTrasen assets by any means necessary. Crew expendable."
	outfit = /datum/outfit/admin/deathsquad
	spawnpoints = list("DeathERTSpawn")
	possible_species = list("Human")
	mob_name_prefix = "Spec. "

	var/deployed = TRUE

/datum/ghostspawner/human/ert/deathsquad/leader
	name = "NT Asset Protection Leader"
	short_name = "ntapl"
	max_count = 1
	desc = "Leader of NT's Asset Protection team."
	outfit = /datum/outfit/admin/deathsquad/leader
	mob_name_prefix = "Ldr. "

/datum/ghostspawner/human/ert/commando
	name = "Syndicate Commando"
	short_name = "syndc"
	max_count = 3
	desc = "Well-equipped commandos of the criminal Syndicate."
	welcome_message = "The order has been given - the Aurora and its crew are to be wiped off the star-charts, by any means necessary."
	outfit = /datum/outfit/admin/deathsquad/syndicate
	spawnpoints = list("SyndERTSpawn")

/datum/ghostspawner/human/ert/commando/leader
	name = "Syndicate Commando Leader"
	short_name = "syndl"
	max_count = 1
	desc = "The leader of the Syndicate's elite commandos."
	outfit = /datum/outfit/admin/deathsquad/syndicate/leader