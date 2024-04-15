/// @description Unload preview
if (character_name != "") {
	character_name = "";
	sprite_delete_if_valid(background_sprite);
	sprite_delete_if_valid(character_sprite);
	sprite_delete_if_valid(foreground_sprite);
	sprite_delete_if_valid(selected_sprite);
}