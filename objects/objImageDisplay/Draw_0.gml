/// @description Insert description here
// You can write your code in this editor

if (!sprite_exists(sprite_index)) {
	exit;
}

// Main surface for character images
if !surface_exists(surface) {
	surface = surface_create_based_on_camera(0);
}
surface_set_target(surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();

var _vx = cam_x(0);
var _vy = cam_y(0);
var _vw = cam_w(0);
var _vh = cam_h(0);
var _small_x_offset = 0;
var _small_y_offset = 0;

var _sprite_width = sprite_width;
var _sprite_height = sprite_height;

if (_sprite_width > _vw || _sprite_height > _vh) {
	// Rescale to fit
	if (_sprite_width / _sprite_height) > (_vw / _vh) {
		// If image is too wide
		_sprite_height = _sprite_height * (_vw / _sprite_width);
		_sprite_width = _vw;
	} else {
		// If image is too tall
		_sprite_width = _sprite_width * (_vh / _sprite_height);
		_sprite_height = _vh;
	}
}

if (_sprite_width < _vw) {
	_small_x_offset = (_vw - _sprite_width)/2;
}
if (_sprite_height < _vh) {
	if (preparing_frames) {
		_small_y_offset = (_vh - _sprite_height)/2;
	} else {
		_small_y_offset = (_vh - _sprite_height);
	}
}
//draw_sprite(sprite_index, image_index, x - _vx + _small_x_offset, y - _vy + _small_y_offset);
draw_scaled(surface, sprite_index, x - _vx + _small_x_offset, y - _vy + _small_y_offset, _sprite_width, _sprite_height);
//surface_reset_target();
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
draw_surface(surface, _vx, _vy);
gpu_set_blendmode(bm_normal);

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
surface_copy_part(zoom_surface, 0, 0, objCutter.cutter_surface, mouse_x-40, mouse_y-40, 80, 80);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
draw_surface_stretched(zoom_surface, _vx+_vw-200, _vy, 200, 200);
gpu_set_blendmode(bm_normal);
