/// @description Insert description here
// You can write your code in this editor

surface_save_part(surface, character_name, 0, 0, target_size, target_size);
	
if (selected_name != "" and mode == 2) {
	mode = 3;
	var _off_index = string_last_pos("_off", objButtonGenerator.target_name);
	var _on_name = "";
	if (string_ends_with(objButtonGenerator.target_name, "_off")) {
		_on_name = string_copy(objButtonGenerator.target_name, 1, _off_index-1) + "_on";
	} else {
		_on_name = objButtonGenerator.target_name + "_on";
	}
	character_name = target_button(objImageDisplay, _on_name, "");
} else {
	mode = 0;
	character_name = "";
}
		