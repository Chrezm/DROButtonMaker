/// @description Start spliting frames
// You can write your code in this editor

if (source_filename == "") {
	exit;	
}

target_filename = pngify(source_filename);
zeroth_filename = string_replace(target_filename, ".png", "-0.png");

// Check if target files already exist. If they do, do nothing.
if (file_exists(target_filename)) {
	// Single frame exists.
	event_user(1);
} else if (file_exists(zeroth_filename)) {
	// Multiple frames exist.
	event_user(1);
} else {
	// No frames exist.	
	process = split_frames(source_filename, target_filename);
	alarm[0] = 10;
}
