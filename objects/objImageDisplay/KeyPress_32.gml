if (current_directory == "") {
	exit;
}

with objFrame {
    event_user(0);
}

current_index++;
if (current_index > ds_map_size(mapEmotions)) {
    current_index = 1;
	show_message("All done, starting from the beginning.")
}
current_filename = ds_map_find_value(mapEmotions, current_index);
event_user(1);