/// @description Insert description here
// You can write your code in this editor

surface_save_part(surface, character_name, 0, 0, 40, 40);
	
if (selected_name != "" and mode == 2) {
	mode = 3;
	character_name = target_button(objImageDisplay, "_on");
} else {
	mode = 0;
	character_name = "";
}
		