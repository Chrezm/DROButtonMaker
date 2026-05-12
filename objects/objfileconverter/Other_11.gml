/// @description Process split frames

// TODO: The whole of this thing needs to be redone to account for multiple sprites needing
// conversion
if (file_exists(current_target_filename)) {
	// Single frame conversion
	var _target_filename_index = array_find_index(full_filenames, function(_full_filename) {
		return pngify(_full_filename) == current_target_filename;
	});
	full_filenames[_target_filename_index] = pngify(full_filenames[_target_filename_index]);
} else if (file_exists(current_zeroth_filename)) {
	// Multiple frame conversions
	objImageDisplay.multiple_frames = true;
	var _zeroth_filename_index = array_find_index(full_filenames, function(_full_filename) {
		return pngify(_full_filename) == current_target_filename
	});
	full_filenames[_zeroth_filename_index] = current_zeroth_filename;
	
	// Decide how many images exist
	var _i = 0;
	var _new_filename;
	while (true) {
		_new_filename = string_replace(current_target_filename, ".png", "-" + string(_i) + ".png");
		if (!file_exists(_new_filename)) {
			break;
		}
		_i++;
	}
	
	objImageDisplay.available_frames = _i-1;
	objImageDisplay.index_of_animated_filename = _zeroth_filename_index;
} else {
	show_messagebox_async(objMessageBox_Accept, "Failed to generate frames for file\n" + current_target_filename);
}

if (array_length(full_filenames_to_convert) == 0) {
	objImageDisplay.current_full_filenames = full_filenames;
	with objImageDisplay {
		event_user(2);
	}
} else {
	event_user(0);	
}