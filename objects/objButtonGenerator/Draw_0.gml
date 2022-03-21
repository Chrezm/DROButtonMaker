/// @description Insert description here
// You can write your code in this editor
if (mode == 1 or mode == 3) {
	if !surface_exists(surface) {
		surface = surface_create(cam_w(0), cam_h(0))
	}
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
	
	var background_sprite, character_sprite, foreground_sprite, selected_sprite;
	if (background_name != "") {
		background_sprite = draw_scaled_from_file(surface, background_name, 0, 0, objButtonGenerator.target_size, objButtonGenerator.target_size);
	} else {
		background_sprite = -1;
	}
	character_sprite = draw_scaled_from_file(surface, character_name, 0, 0, objButtonGenerator.target_size, objButtonGenerator.target_size);
	if (foreground_name != "") {
		foreground_sprite = draw_scaled_from_file(surface, foreground_name, 0, 0, objButtonGenerator.target_size, objButtonGenerator.target_size);
	} else {
		foreground_sprite = -1;
	}	
	if (mode == 3) {
		selected_sprite = draw_scaled_from_file(surface, selected_name, 0, 0, objButtonGenerator.target_size, objButtonGenerator.target_size);
	}
	sprite_delete(background_sprite);
	sprite_delete(character_sprite);
	sprite_delete(foreground_sprite);
	if (mode == 3) {
		sprite_delete(selected_sprite);
	}
	
	mode++;
	alarm[0] = 1;
	var _vx = cam_x(0);
	var _vy = cam_y(0);
	draw_surface(surface, _vx, _vy);
}