/// @description Insert description here
// You can write your code in this editor
if (mode == 1 or mode == 3) {
	if !surface_exists(surface) {
		surface = surface_create_based_on_camera(0);
	}
	surface_set_target(surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	
	var size = objButtonGenerator.target_size;
	
	var background_sprite, character_sprite, foreground_sprite, selected_sprite, mask_sprite, negative_mask_sprite;
	if (background_name != "") {
		background_sprite = draw_scaled_from_file(surface, background_name, 0, 0, size, size);
	} else {
		background_sprite = -1;
	}
	character_sprite = draw_scaled_from_file(surface, character_name, 0, 0, size, size);
	if (foreground_name != "") {
		foreground_sprite = draw_scaled_from_file(surface, foreground_name, 0, 0, size, size);
	} else {
		foreground_sprite = -1;
	}	
	if (mode == 3) {
		selected_sprite = draw_scaled_from_file(surface, selected_name, 0, 0, size, size);
	} else {
		selected_sprite = -1;
	}
	if (mask_name != "") {
		if !surface_exists(mask_surface) {
			mask_surface = surface_create_based_on_camera(0);
		}
		surface_set_target(mask_surface);
		draw_clear_alpha(c_white, 0);
		surface_reset_target();
		mask_sprite = draw_scaled_from_file(mask_surface, mask_name, 0, 0, size, size);
		
		negative_mask_sprite = sprite_create_from_surface(mask_surface, 0, 0, size, size, 0, 0, 0, 0);
		surface_set_target(surface);
		gpu_set_blendmode(bm_subtract);
		shader_set(sh_invert_alpha);
		draw_sprite(negative_mask_sprite, 0, 0, 0);
		shader_reset();
		gpu_set_blendmode(bm_normal);
		surface_reset_target();		
	} else {
		mask_sprite = -1;
		negative_mask_sprite = -1;
	}
		
	sprite_delete_if_valid(background_sprite);
	sprite_delete_if_valid(character_sprite);
	sprite_delete_if_valid(foreground_sprite);
	if (mode == 3) {
		sprite_delete_if_valid(selected_sprite);
	}
	sprite_delete_if_valid(mask_sprite);
	sprite_delete_if_valid(negative_mask_sprite);
	
	mode++;
	alarm[0] = 1;
	var _vx = cam_x(0);
	var _vy = cam_y(0);
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_surface(surface, _vx, _vy);
	gpu_set_blendmode(bm_normal);
}