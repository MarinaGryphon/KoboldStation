/datum/species/kobold
    name = "Kobold"
    hide_name = TRUE
    short_name = "kob"
    name_plural = "Kobolds"
    bodytype = "Kobold"
    icobase = 'icons/mob/human_races/kobold/r_kob.dmi'
    deform = 'icons/mob/human_races/kobold/r_def_kob.dmi'
    preview_icon = 'icons/mob/human_races/kobold/kobold_preview.dmi'
    tail = "kobtail"
    tail_animation = 'icons/mob/species/kobold/tail.dmi'
    tail_transform = list("NORTH" = 0, "EAST" = 2) // move right 2
    unarmed_types = list(
        /datum/unarmed_attack/stomp,
        /datum/unarmed_attack/kick,
        /datum/unarmed_attack/claws,
        /datum/unarmed_attack/bite/sharp
    )
    primitive_form = "Dwarf"
    greater_form = "Dragon"
    darksight = 3
    slowdown = 0.5
    brute_mod = 0.8
    ethanol_resistance = 0.8
    taste_sensitivity = TASTE_SENSITIVE
    economic_modifier = 10

    num_alternate_languages = 3
    language = LANGUAGE_KOBOLD
    name_language = LANGUAGE_KOBOLD
    stamina =   120           // Shorter, faster than humans.
    sprint_speed_factor = 3.2
    stamina_recovery = 5
    sprint_cost_factor = 1.45
    exhaust_threshold = 65
    rarity_value = 3
    mob_size = 7
    climb_coeff = 1.35

    blurb = "TODO"

    cold_level_1 = 280 //Default 260 - Lower is better
    cold_level_2 = 220 //Default 200
    cold_level_3 = 130 //Default 120

    heat_level_1 = 420 //Default 360 - Higher is better
    heat_level_2 = 480 //Default 400
    heat_level_3 = 1100 //Default 1000



    spawn_flags = CAN_JOIN
    appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

    flesh_color = "#34AF10"

    reagent_tag = IS_KOBOLD
    base_color = "#066000"

    heat_discomfort_level = 295
    heat_discomfort_strings = list(
        "You feel soothingly warm.",
        "You feel the heat sink into your bones.",
        "You feel warm enough to take a nap."
        )

    cold_discomfort_level = 292
    cold_discomfort_strings = list(
        "You feel chilly.",
        "You feel sluggish and cold.",
        "Your scales bristle against the cold."
        )

    move_trail = /obj/effect/decal/cleanable/blood/tracks/claw