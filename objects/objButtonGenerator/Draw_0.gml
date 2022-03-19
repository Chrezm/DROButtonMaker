/// @description Insert description here
// You can write your code in this editor
if (mode == 1 or mode == 3) {
	if !surface_exists(surface) {
		surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
	}
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
	
	var background_sprite, character_sprite, foreground_sprite, selected_sprite;
	if (background_name != "") {
		background_sprite = draw_scaled_from_file(surface, background_name, 0, 0);
	} else {
		background_sprite = -1;
	}
	character_sprite = draw_scaled_from_file(surface, character_name, 0, 0);
	if (mode == 3) {
		selected_sprite = draw_scaled_from_file(surface, selected_name, 0, 0);
	}
	if (foreground_name != "") {
		foreground_sprite = draw_scaled_from_file(surface, foreground_name, 0, 0);
	} else {
		foreground_sprite = -1;
	}
	sprite_delete(background_sprite);
	sprite_delete(character_sprite);
	if (mode == 3) {
		sprite_delete(selected_sprite);
	}
	sprite_delete(foreground_sprite);
	
	mode++;
	alarm[0] = 1;
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	draw_surface(surface, _vx, _vy);
}