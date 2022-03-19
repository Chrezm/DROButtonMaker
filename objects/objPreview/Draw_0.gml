/// @description Insert description here
// You can write your code in this editor

if (character_name != "") {
	var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - preview_size;
	var _y = camera_get_view_y(view_camera[0]);
	if (sprite_exists(background_sprite)) {
		draw_scaled(application_surface, background_sprite, _x, _y, preview_size, preview_size);
	}
	draw_scaled(application_surface, character_sprite, _x, _y, preview_size, preview_size);
	if (sprite_exists(selected_sprite)) {
		if (current_second % 2 == 0) {
			draw_scaled(application_surface, selected_sprite, _x, _y, preview_size, preview_size);
		}
	}
	if (sprite_exists(foreground_sprite)) {
		draw_scaled(application_surface, foreground_sprite, _x, _y, preview_size, preview_size);
	}
}