/// @description Previous image

if (current_directory == "") {
	exit;
}

current_index--;
if (current_index < 1) {
    current_index = ds_map_size(mapEmotions);
	show_messagebox_async(objMessageBox_Accept, "That was the first image,\ngoing to the last image.")
}

current_filename = ds_map_find_value(mapEmotions, current_index);
event_user(1);