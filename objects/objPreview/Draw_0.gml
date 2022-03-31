/// @description Insert description here
// You can write your code in this editor

if (character_name != "") {
	if !surface_exists(preview_surface) {
		preview_surface = surface_create(cam_w(0), cam_h(0));
	}
	surface_set_target(preview_surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
	
	var _x = cam_x(0) + cam_w(0) - preview_size;
	var _y = cam_y(0);	
		
	if (sprite_exists(background_sprite)) {
		draw_scaled(preview_surface, background_sprite, _x, _y, preview_size, preview_size);
	}
	draw_scaled(preview_surface, character_sprite, _x, _y, preview_size, preview_size);
	if (sprite_exists(foreground_sprite)) {
		draw_scaled(preview_surface, foreground_sprite, _x, _y, preview_size, preview_size);
	}
	if (sprite_exists(selected_sprite)) {
		if (current_second % 2 == 0) {
			draw_scaled(preview_surface, selected_sprite, _x, _y, preview_size, preview_size);
		}
	}
	if (sprite_exists(mask_sprite)) {
		if !surface_exists(mask_surface) {
			mask_surface = surface_create(cam_w(0), cam_h(0));
		}
		surface_set_target(mask_surface);
		draw_clear_alpha(c_white, 0);
		surface_reset_target();
		draw_scaled(mask_surface, mask_sprite, 0, 0, preview_size, preview_size);
		
		negative_mask_sprite = sprite_create_from_surface(mask_surface, 0, 0, preview_size, preview_size, 0, 0, 0, 0);
		surface_set_target(preview_surface);
		gpu_set_blendmode(bm_subtract);
		shader_set(sh_invert_alpha);
		draw_sprite(negative_mask_sprite, 0, _x, _y);
		shader_reset();
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
		sprite_delete(negative_mask_sprite);
	}
	
	var _vx = cam_x(0);
	var _vy = cam_y(0);
	draw_surface(preview_surface, _vx, _vy);
}