/// @description Process split frames

if (file_exists(target_filename)) {
	// Single frame conversion
	objImageDisplay.current_full_filename = target_filename;
	with objImageDisplay {
		event_user(2);
	}
} else if (file_exists(zeroth_filename)) {
	// Multiple frame conversions
	objImageDisplay.multiple_frames = true;
	objImageDisplay.current_full_filename = zeroth_filename;
	with objImageDisplay {
		event_user(2);
	}
	
	// Decide how many images exist
	var i = 0;
	var new_filename;
	while (true) {
		new_filename = string_replace(target_filename, ".png", "-" + string(i) + ".png");
		if (!file_exists(new_filename)) {
			break;
		}
		i++;
	}
	// The last frame file imagemagick generates is garbage, so delete it
	var garbage_file;
	garbage_file = string_replace(target_filename, ".png", "-" + string(i-1) + ".png");
	file_delete(garbage_file);
	
	objImageDisplay.available_frames = i-1;
} else {
	show_message("Failed to generate frames for file");
	show_message(target_filename);
}