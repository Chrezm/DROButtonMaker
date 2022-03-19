/// @description Unload preview
if (character_name != "") {
	character_name = "";
	sprite_delete(background_sprite);
	sprite_delete(character_sprite);
	sprite_delete(foreground_sprite);
	sprite_delete(selected_sprite);
}