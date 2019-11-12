// Noise "language", for audible emotes.
/datum/language/noise
	name = "Noise"
	desc = "Noises"
	key = ""
	flags = RESTRICTED|NONGLOBAL|INNATE|NO_TALK_MSG|NO_STUTTER|TCOMSSIM

/datum/language/noise/format_message(message, verb)
	return "<span class='message'><span class='[colour]'>[message]</span></span>"

/datum/language/noise/format_message_plain(message, verb)
	return message

/datum/language/noise/format_message_radio(message, verb)
	return "<span class='[colour]'>[message]</span>"

/datum/language/noise/get_talkinto_msg_range(message)
	// if you make a loud noise (screams etc), you'll be heard from 4 tiles over instead of two
	return (copytext(message, length(message)) == "!") ? 4 : 2

// Sign language
/datum/language/sign
	name = LANGUAGE_SIGN
	desc = "A signed version of Ceti Basic, though its intent is primarily to help out people who are deaf and mute, "
	speech_verb = "signs"
	signlang_verb = list("signs", "gestures")
	colour = "i"
	key = "4"
	flags = NO_STUTTER|SIGNLANG

// Helper
/proc/get_lang_name(var/datum/language/language)
	if (!language || !istype(language))
		return "Unknown"

	return language.name
