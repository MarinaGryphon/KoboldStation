/mob/living/proc/write_ambition()
	set name = "Set Ambition"
	set category = "IC"
	set src = usr

	if(!mind)
		return
	if(!is_special_character(src))
		to_chat(src, "<span class='warning'>While you may perhaps have goals, this verb's meant to only be visible to antagonists.  Please make a bug report!</span>")
		return
	var/new_ambitions = input(src, "Write a short sentence of what your character hopes to accomplish \
	today as an antagonist.  Remember that this is purely optional.  It will be shown at the end of the \
	round for everybody else.", "Ambitions", mind.ambitions) as null|message
	if(isnull(new_ambitions))
		return
	new_ambitions = sanitize(new_ambitions)
	mind.ambitions = new_ambitions
	if(new_ambitions)
		to_chat(src, "<span class='notice'>You've set your goal to be '[new_ambitions]'.</span>")
	else
		to_chat(src, "<span class='notice'>You leave your ambitions behind.</span>")
