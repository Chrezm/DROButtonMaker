/// @description

if (!visible) {
	exit;
}

with objImageDisplay {
	current_frame -= 1;
	if (current_frame < 0) {
		current_frame = available_frames - 1;
	}
	// TODO: Fix when supporting multiple filenames using frames
	if (array_length(current_full_filenames) == 0) {
		// This shouldn't happen
		throw ("Empty current full filenames detected when trying to go to previous frame");	
	}
	current_full_filenames[0] = string_replace(objFileConverter.target_filename, ".png", "-" + string(current_frame) + ".png");
	event_user(2);
}