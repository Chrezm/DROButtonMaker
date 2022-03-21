/// @description Insert description here
// You can write your code in this editor
if (!sprite_exists(sprite_index)) {
	exit;
}

// Main surface for character images
if !surface_exists(surface) {
	surface = surface_create(cam_w(0), cam_h(0))
}
surface_set_target(surface);
draw_clear_alpha(c_white, 0);
var _vx = cam_x(0);
var _vy = cam_y(0);
var _vw = cam_w(0);
var _vh = cam_h(0);
var _small_x_offset = 0;
var _small_y_offset = 0;
if (sprite_width < _vw) {
	_small_x_offset = (_vw - sprite_width)/2;
}
if (sprite_height < _vh) {
	_small_y_offset = (_vh - sprite_height);
}
draw_sprite(sprite_index, image_index, x - _vx + _small_x_offset, y - _vy + _small_y_offset);
surface_reset_target();
draw_surface(surface, _vx, _vy);

// Surface for zoom
if (!draw_zoom) {
	exit;
}
if !surface_exists(zoom_surface) {
	zoom_surface = surface_create(80, 80);
}
surface_set_target(zoom_surface);
draw_clear_alpha(c_white, 0);
surface_reset_target();
surface_copy_part(zoom_surface, 0, 0, surface, mouse_x-_vx-40, mouse_y-_vy-40, 80, 80);
surface_copy_part(zoom_surface, 0, 0, objFrame.frame_surface, mouse_x-40, mouse_y-40, 80, 80);
draw_surface_stretched(zoom_surface, _vx+_vw-200, _vy, 200, 200);
