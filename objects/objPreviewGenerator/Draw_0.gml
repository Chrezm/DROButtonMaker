/// @description Insert description here
// You can write your code in this editor
if (mode == 1) {
	if !surface_exists(surface) {
		surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
	}
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
	
	var background_sprite, character_sprite, foreground_sprite;
	if (background_name != "") {
		background_sprite = draw_scaled(surface, background_name);
	} else {
		background_sprite = -1;
	}
	character_sprite = draw_scaled(surface, filename);
	if (foreground_name != "") {
		foreground_sprite = draw_scaled(surface, foreground_name);
	} else {
		foreground_sprite = -1;
	}
	sprite_delete(background_sprite);
	sprite_delete(character_sprite);
	sprite_delete(foreground_sprite);
	
	mode = 2;
	alarm[0] = 1;
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	draw_surface(surface, _vx, _vy);
}