/// @description Insert description here
// You can write your code in this editor
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 40;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 40;

if (filename != "") {
	if (sprite_exists(background_sprite)) {
		draw_sprite(background_sprite, image_index, _x, _y);
	}
	draw_sprite(character_sprite, image_index, _x, _y);
	if (sprite_exists(foreground_sprite)) {
		draw_sprite(foreground_sprite, image_index, _x, _y);
	}
}