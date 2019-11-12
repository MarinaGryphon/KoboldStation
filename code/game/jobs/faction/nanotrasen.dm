/datum/faction/koboldsyndicate
	name = "United Kobold Syndicate"
	description = "A united group of kobolds created after successfully getting independence from dragons."
	title_suffix = "UKS"

	is_default = TRUE

/datum/faction/koboldsyndicate/New()
	..()

	allowed_role_types = list()

	for (var/datum/job/job in SSjobs.occupations)
		allowed_role_types += job.type

	// Really shitty hack until I get around to rewriting jobs a bit.
	allowed_role_types -= /datum/job/merchant

/datum/faction/koboldsyndicate/get_corporate_objectives(var/mission_level)
	var/objective
	switch(mission_level)
		if(REPRESENTATIVE_MISSION_HIGH)
			objective = pick("Have [rand(1,4)] crewmembers sign research apprenticeship contracts")
		if(REPRESENTATIVE_MISSION_MEDIUM)
			objective = pick("Have [rand(2,5)] crewmembers pledge loyalty to the UKS")
		else
			objective = pick("Conduct and present a survey on crew morale and content",
						"Make sure that [rand(2,4)] complaints are solved on the station",
						"Have [rand(3,10)] crewmembers buy Getmore products from the vendors")

	return objective