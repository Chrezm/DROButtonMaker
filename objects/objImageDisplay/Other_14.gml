/// @description Skip Image

if (current_directory == "") {
	exit;
}

current_index++;
if (current_index > ds_map_size(emotions)) {
    current_index = 1;
	show_messagebox_async(objMessageBox_Accept, "That was the last image,\ngoing back to the first image.")
}

current_filename = ds_map_find_value(emotions, current_index);
event_user(1);