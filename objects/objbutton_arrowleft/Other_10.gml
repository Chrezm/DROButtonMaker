/// @description

if (!visible) {
	exit;
}

with objImageDisplay {
	current_frame -= 1;
	if (current_frame < 0) {
		current_frame = available_frames - 1;
	}
	current_full_filename = string_replace(objFileConverter.target_filename, ".png", "-" + string(current_frame) + ".png");
	event_user(2);
}