/// @description Unload preview
if (character_name != "") {
	character_name = "";
	if (background_sprite >= 0) {
		sprite_delete(background_sprite);
	}
	if (character_sprite >= 0) {
		sprite_delete(character_sprite);
	}
	if (foreground_sprite >= 0) {
		sprite_delete(foreground_sprite);
	}
	if (selected_sprite >= 0) {
		sprite_delete(selected_sprite);
	}
}