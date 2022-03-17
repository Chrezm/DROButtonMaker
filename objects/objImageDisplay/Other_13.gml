/// @description Skip Image

if (current_directory == "") {
	exit;
}

current_index++;
if (current_index > ds_map_size(mapEmotions)) {
    current_index = 1;
	show_message("That was the last image, starting from the beginning.")
}

current_filename = ds_map_find_value(mapEmotions, current_index);
event_user(1);