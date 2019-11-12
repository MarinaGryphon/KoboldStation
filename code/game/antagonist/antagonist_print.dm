/datum/antagonist/proc/print_player_summary()

	if(!current_antagonists.len)
		return 0

	var/text = "<br><br><font size = 2><b>The [current_antagonists.len == 1 ? "[role_text] was" : "[role_text_plural] were"]:</b></font>"
	for(var/datum/mind/P in current_antagonists)
		text += print_player_full(P)
		if(P.ambitions)
			text += "<br><font color='purple'><b>Their goals for today were:</b></font>"
			text += "<br>  '[P.ambitions]'"

	// Display the results.
	to_world(text)

/datum/antagonist/proc/print_player_lite(var/datum/mind/ply)
	var/role = ply.assigned_role ? "\improper[ply.assigned_role]" : "\improper[ply.special_role]"
	var/text = "<br><b>[ply.name]</b> as \a <b>[role]</b> ("
	if(ply.current)
		if(ply.current.stat == DEAD)
			text += "died"
		else if(isNotStationLevel(ply.current.z))
			text += "fled the station"
		else
			text += "survived"
		if(ply.current.real_name != ply.name)
			text += " as <b>[ply.current.real_name]</b>"
	else
		text += "body destroyed"
	text += ")"

	return text

/datum/antagonist/proc/print_player_full(var/datum/mind/ply)
	var/text = print_player_lite(ply)

	var/TC_uses = 0
	var/uplink_true = 0
	var/purchases = ""
	for(var/obj/item/device/uplink/H in world_uplinks)
		if(H && H.uplink_owner && H.uplink_owner == ply)
			TC_uses += H.used_TC
			uplink_true = 1
			purchases += get_uplink_purchases(H)
	if(uplink_true)
		text += " (used [TC_uses] TC)"
		if(purchases)
			text += "<br>[purchases]"

	return text

/proc/print_ownerless_uplinks()
	var/has_printed = 0
	for(var/obj/item/device/uplink/H in world_uplinks)
		if(isnull(H.uplink_owner) && H.used_TC)
			if(!has_printed)
				has_printed = 1
				to_world("<b>Ownerless Uplinks</b>")
			to_world("[H.loc] (used [H.used_TC] TC)")
			to_world(get_uplink_purchases(H))

/proc/get_uplink_purchases(var/obj/item/device/uplink/H)
	var/list/refined_log = new()
	for(var/datum/uplink_item/UI in H.purchase_log)
		refined_log.Add("[H.purchase_log[UI]]x[UI.log_icon()][UI.name]")
	. = english_list(refined_log, nothing_text = "")

/datum/antagonist/proc/print_player_summary_discord()
	if (current_antagonists.len)
		return ""

	var/text = "[current_antagonists.len > 1 ? "The [lowertext(role_text_plural)] were:\n" : "The [lowertext(role_text)] was:\n"]"
	for (var/datum/mind/ply in current_antagonists)
		var/role = ply.assigned_role ? "\improper[ply.assigned_role]" : "\improper[ply.special_role]: "
		text += "**[ply.name]** as \a **[role]** ("
		if(ply.current)
			if(ply.current.stat == DEAD)
				text += "died"
			else if(isNotStationLevel(ply.current.z))
				text += "fled the station"
			else
				text += "survived"
			if(ply.current.real_name != ply.name)
				text += " as **[ply.current.real_name]**"
		else
			text += "body destroyed"
		text += ")\n"

	text += "\n"

	return text
