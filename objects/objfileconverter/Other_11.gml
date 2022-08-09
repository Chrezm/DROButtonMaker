/// @description Process split frames

if (file_exists(target_filename)) {
	// Single frame conversion
	objImageDisplay.current_full_filename = target_filename;
	with objImageDisplay {
		event_user(2);
	}
	exit;
}

zeroth_filename = string_replace(target_filename, ".png", "-0.png")
if (file_exists(zeroth_filename)) {
	// Multiple frame conversions
	objImageDisplay.current_full_filename = zeroth_filename;
	with objImageDisplay {
		event_user(2);
	}
	exit;
}

show_message("Failed to generate frames for file");
show_message(target_filename);
	