/// @description Insert description here
// You can write your code in this editor

if (!sprite_exists(sprite_index) && array_length(current_full_filenames) == 0) {
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

var _reference_sprite = preparing_frames ? sprite_index : current_sprites[0];
var _rw = _reference_sprite == -1 ? _vw : sprite_get_width(_reference_sprite);
var _rh = _reference_sprite == -1 ? _vh : sprite_get_height(_reference_sprite);

var _general_x_multiplier = 1;
var _general_x_offset = 0;
var _general_y_multiplier = 1;
var _general_y_offset = 0;
var _general_width_multiplier = 1;
var _general_width_offset = 0;
var _general_height_multiplier = 1;
var _general_height_offset = 0;

if (_rw > _vw || _rh > _vh) {
	// Rescale to fit
	if (_rw / _rh) > (_vw / _vh) {
		// If image is too wide
		_general_height_multiplier = _vw / _rw;
	} else {
		// If image is too tall
		_general_width_multiplier = _vh / _rh;
	}
}

if (_rw < _vw) {
	_general_x_offset = (_vw - _rw)/2;
}
if (_rh < _vh) {
	if (preparing_frames) {
		_general_y_offset = (_vh - _rh)/2;
	} else {
		_general_y_offset = (_vh - _rh);
	}
}

for (var _i = 0; _i < array_length(current_sprites); _i++) {
	if (current_sprites[_i] == -1) {
		continue;
	}
	var _component_info = current_emote.components[_i]
	var _sx = (x - _vx) + (is_undefined(_component_info.cx) ? 0 : _component_info.cx);
	var _sy = (y - _vy) + (is_undefined(_component_info.cy) ? 0 : _component_info.cy);
	var _sw = 0 + (is_undefined(_component_info.cw) ? _rw : _component_info.cw);
	var _sh = 0 + (is_undefined(_component_info.ch) ? _rh : _component_info.ch);	
	
	var _ax = _sx * _general_x_multiplier + _general_x_offset;
	var _ay = _sy * _general_y_multiplier + _general_y_offset;
	var _aw = _sw * _general_width_multiplier + _general_width_offset;
	var _ah = _sh * _general_height_multiplier + _general_height_offset;
		
	draw_scaled(surface, current_sprites[_i], _ax, _ay, _aw, _ah);
}
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
draw_surface(surface, _vx, _vy);
gpu_set_blendmode(bm_normal);

// Surface for zoom
if (!draw_zoom) {
	exit;
}
if !surface_exists(objCutter.cutter_surface) {
	throw ("Cutter surface does not exist");
}
if !surface_exists(zoom_surface) {
	zoom_surface = surface_create(80, 80);
}
surface_set_target(zoom_surface);
draw_clear_alpha(c_black, 0);
draw_surface_part_clipped(surface, mouse_x-_vx-40, mouse_y-_vy-40, 80, 80, 0, 0);
draw_surface_part_clipped(objCutter.cutter_surface, mouse_x-40, mouse_y-40, 80, 80, 0, 0);
surface_reset_target();
gpu_set_texfilter(false);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
draw_surface_stretched(zoom_surface, _vx+_vw-200, _vy, 200, 200);
gpu_set_blendmode(bm_normal);
gpu_set_texfilter(true);
