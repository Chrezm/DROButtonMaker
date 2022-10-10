/// @description Insert description here
// You can write your code in this editor

current_index++;
if (current_index > ds_map_size(mapEmotions)) {
    current_index = 1;
	show_messagebox(objMessageBox_Accept, "That was the last image,\ngoing back to the first image.")
}

current_filename = ds_map_find_value(mapEmotions, current_index);
event_user(1);