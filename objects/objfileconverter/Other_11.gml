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
	var _i = 0;
	var _new_filename;
	while (true) {
		_new_filename = string_replace(target_filename, ".png", "-" + string(_i) + ".png");
		if (!file_exists(_new_filename)) {
			break;
		}
		_i++;
	}
	
	objImageDisplay.available_frames = _i-1;
} else {
	show_messagebox_async(objMessageBox_Accept, "Failed to generate frames for file\n" + target_filename);
}