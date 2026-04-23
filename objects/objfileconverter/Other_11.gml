/// @description Process split frames

// TODO: The whole of this thing needs to be redone to account for multiple sprites needing
// conversion
if (file_exists(target_filename)) {
	// Single frame conversion
	objImageDisplay.current_full_filenames = full_filenames;
	var _target_filename_index = array_find_index(full_filenames, function(_full_filename) {
		return _full_filename == target_filename
	});
	full_filenames[_target_filename_index] = zeroth_filename;
	with objImageDisplay {
		event_user(2);
	}
} else if (file_exists(zeroth_filename)) {
	// Multiple frame conversions
	objImageDisplay.multiple_frames = true;
	var _zeroth_filename_index = array_find_index(full_filenames, function(_full_filename) {
		return _full_filename == zeroth_filename
	});
	full_filenames[_zeroth_filename_index] = zeroth_filename;
	objImageDisplay.current_full_filenames = full_filenames;
	
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