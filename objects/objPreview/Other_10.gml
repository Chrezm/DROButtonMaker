/// @description Load preview
if (objButtonGenerator.background_name != "") {
	background_sprite = sprite_add(objButtonGenerator.background_name, 1, 0, 0, 0, 0);
} else {
	background_sprite = -1;
}
character_sprite = sprite_add(character_name, 1, 0, 0, 0, 0);
if (objButtonGenerator.foreground_name != "") {
	foreground_sprite = sprite_add(objButtonGenerator.foreground_name, 1, 0, 0, 0, 0);
} else {
	foreground_sprite = -1;
}
if (objButtonGenerator.selected_name != "") {
	selected_sprite = sprite_add(objButtonGenerator.selected_name, 1, 0, 0, 0, 0);
} else {
	selected_sprite = -1;
}

preview_size = objButtonGenerator.target_size;