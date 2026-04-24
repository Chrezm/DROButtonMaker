/// @description Start spliting frames
// You can write your code in this editor

if (array_length(full_filenames_to_convert) == 0) {
	exit;
}

var _source_filename = array_pop(full_filenames_to_convert);
current_target_filename = pngify(_source_filename);
current_zeroth_filename = string_replace(current_target_filename, ".png", "-0.png");

// Check if target files already exist. If they do, do nothing.
if (file_exists(current_target_filename)) {
	// Single frame exists.
	event_user(1);
} else if (file_exists(current_zeroth_filename)) {
	// Multiple frames exist.
	event_user(1);
} else {
	// No frames exist.	
	process = split_frames(_source_filename, current_target_filename);
	alarm[0] = 10;
}
