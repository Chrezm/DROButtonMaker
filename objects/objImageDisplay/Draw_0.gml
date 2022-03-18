/// @description Insert description here
// You can write your code in this editor
if (sprite_exists(sprite_index)) {
	if !surface_exists(surface) {
		surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
	}
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	draw_sprite(sprite_index, image_index, x - _vx, y - _vy);
	surface_reset_target();
	draw_surface(surface, _vx, _vy);
}
	