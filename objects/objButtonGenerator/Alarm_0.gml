/// @description Insert description here
// You can write your code in this editor

surface_save_part(surface, character_name, 0, 0, target_size, target_size);
	
if (selected_name != "" and mode == 2 and string_pos("_off", objButtonGenerator.target_name) > 0) {
	mode = 3;
	character_name = target_button(objImageDisplay, string_replace(objButtonGenerator.target_name, "_off", "_on"), "");
} else {
	mode = 0;
	character_name = "";
}
		