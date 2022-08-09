/// @description Process split frames

if (file_exists(target_filename)) {
	// Single frame conversion
	with objImageDisplay {
		current_full_filename = other.target_filename;
		event_user(2);
	}
	exit;
}
show_message("Unsupported");
show_message(target_filename);
	