/// @description Load preview
if (objPreviewGenerator.background_name != "") {
	background_sprite = sprite_add(objPreviewGenerator.background_name, 1, 0, 0, 0, 0);
} else {
	background_sprite = -1;
}
character_sprite = sprite_add(filename, 1, 0, 0, 0, 0);
if (objPreviewGenerator.foreground_name != "") {
	foreground_sprite = sprite_add(objPreviewGenerator.foreground_name, 1, 0, 0, 0, 0);
} else {
	foreground_sprite = -1;
}