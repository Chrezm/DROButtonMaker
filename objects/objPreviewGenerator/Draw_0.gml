/// @description Insert description here
// You can write your code in this editor
if (mode == 1) {
	if !surface_exists(surface) {
		surface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
	}
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	surface_reset_target();
	draw_scaled(surface, filename);
	mode = 2;
	alarm[0] = 1;
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	draw_surface(surface, _vx, _vy);
}