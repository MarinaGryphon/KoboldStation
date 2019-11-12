/datum/species/kobold/dragon
    name = "Dragon"
    short_name = "dra"
    name_plural = "Cops"
    bodytype = "Dragon"
    primitive_form = "Kobold"
    icon_template = 'icons/mob/human_races/kobold/r_dragon.dmi'
    icobase = 'icons/mob/human_races/kobold/r_dragon.dmi'
    deform = 'icons/mob/human_races/kobold/r_dragon.dmi'
    num_alternate_languages = 3
    language = LANGUAGE_DRAGON
    name_language = LANGUAGE_DRAGON
//icon_x_offset = -8
    unarmed_types = list(/datum/unarmed_attack/claws/cleave, /datum/unarmed_attack/bite/strong)
    rarity_value = 10
    slowdown = 0
//eyes = "dragon_eyes"
//eyes_icons = 'icons/mob/human_face/dragon_eyes.dmi'
//Actual dragon sprites are WIP, uncomment when necessary. -Pan
    brute_mod = 0.5
    burn_mod = 0.1
    fall_mod = 0
    toxins_mod = 1
    grab_mod = 10
    total_health = 200
    breakcuffs = list(MALE,FEMALE,NEUTER)
    mob_size = 30

    speech_sounds = list('sound/voice/roar1.ogg','sound/voice/roar2.ogg','sound/voice/roar3.ogg','sound/voice/roar4.ogg')
    speech_chance = 100

    death_sound = 'sound/voice/roar6.ogg'
    damage_overlays = 'icons/mob/human_races/masks/dam_mask_dragon.dmi'
    damage_mask = 'icons/mob/human_races/masks/dam_mask_dragon.dmi'
    blood_mask = 'icons/mob/human_races/masks/dam_mask_dragon.dmi'
    onfire_overlay = 'icons/mob/OnFire_large.dmi'


    stamina = 200
    stamina_recovery = 5
    sprint_speed_factor = 0.9
    sprint_cost_factor = 0.5

    heat_level_1 = 1000 //Default 360
    heat_level_2 = 4000 //Default 400
    heat_level_3 = 16000 //Default 1000
    hazard_high_pressure = 55000 //Default 550
    warning_high_pressure = 3250 //Default 325

    spawn_flags = CAN_JOIN
    flags = NO_SLIP

    inherent_verbs = list(
        /mob/living/carbon/human/proc/rebel_yell,
        /mob/living/carbon/human/proc/devour_head,
        /mob/living/carbon/human/proc/fire_spray,
        /mob/living/carbon/human/proc/trample
        )

    has_organ = list(
        "lungs"               = /obj/item/organ/lungs/dragon,
        "heart"               = /obj/item/organ/heart/dragon,
        "brain"               = /obj/item/organ/brain/dragon,
        "eyes"                = /obj/item/organ/eyes/dragon,
        "kidney"              = /obj/item/organ/kidney/dragon,
        "liver"               = /obj/item/organ/liver/dragon
    )

    default_h_style = "Bald"

