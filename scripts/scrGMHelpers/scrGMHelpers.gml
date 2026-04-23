function string_split(_s, _d) {
	var _r = array_create(0);
	var _p = string_pos(_d, _s);
	var _dl = string_length(_d);
	if (_dl) while (_p) {
	    _p -= 1;
	    array_push(_r, string_copy(_s, 1, _p));
	    _s = string_delete(_s, 1, _p + _dl);
	    _p = string_pos(_d, _s);
	}
	array_push(_r, _s);
	return _r;
}

function string_startswith(_substr, _str) {
	return string_pos(_substr, _str) == 1;
}

function draw_scaled(_surface, _sprite, _x, _y, _width, _height) {
	surface_set_target(_surface);
	sprite_index = _sprite;
	var _scale_for_width = _width / sprite_width;
	var _scale_for_height = _height / sprite_height;
	if (_scale_for_width == 1 && _scale_for_height == 1)
		draw_sprite(sprite_index, image_index, _x, _y);
	else
		better_scaling_draw_sprite(sprite_index, image_index, _x, _y, _scale_for_width, _scale_for_height, image_angle, image_blend, image_alpha, 1);
	surface_reset_target();
	return;
}

function draw_scaled_from_file(_surface, _source_file, _x, _y, _width, _height) {
	var _file_sprite = sprite_add(_source_file, 1, 0, 0, 0, 0);
	draw_scaled(_surface, _file_sprite, _x, _y, _width, _height);
	return _file_sprite;
}

function draw_surface_part_clipped(_surf, _src_x, _src_y, _w, _h, _dst_x, _dst_y) {
	if (!surface_exists(_surf)) return;

	var _sw = surface_get_width(_surf);
	var _sh = surface_get_height(_surf);

	var _clip_x1 = max(0, _src_x);
	var _clip_y1 = max(0, _src_y);
	var _clip_x2 = min(_sw, _src_x + _w);
	var _clip_y2 = min(_sh, _src_y + _h);

	var _clip_w = _clip_x2 - _clip_x1;
	var _clip_h = _clip_y2 - _clip_y1;

	if (_clip_w <= 0 || _clip_h <= 0) return;

	var _draw_x = _dst_x + (_clip_x1 - _src_x);
	var _draw_y = _dst_y + (_clip_y1 - _src_y);

	draw_surface_part(_surf, _clip_x1, _clip_y1, _clip_w, _clip_h, _draw_x, _draw_y);
}

function cam_x(_num) {
	return camera_get_view_x(view_camera[_num]);
}

function cam_y(_num) {
	return camera_get_view_y(view_camera[_num]);
}

function cam_h(_num) {
	return camera_get_view_height(view_camera[_num]);
}

function cam_w(_num) {
	return camera_get_view_width(view_camera[_num]);
}

function show_messagebox_async(_messagebox_type, _message) {
	obj = instance_create_depth(x, y, objController.depth-10, _messagebox_type);
	obj.text = _message;
	obj.has_input_box = false;
	return obj;	
}

function show_inputbox_async(_inputbox_type, _message, _default_value) {
	obj = instance_create_depth(x, y, objController.depth-10, _inputbox_type);
	obj.text = _message;
	obj.has_input_box = true;
	keyboard_string = string(_default_value);
	return obj;
}

function surface_create_based_on_camera(_camera_index) {
	var _cam_w = cam_w(_camera_index);
	var _cam_h = cam_h(_camera_index);
	var _surface = surface_create(_cam_w, _cam_h);
	return _surface;
}

function sprite_delete_if_valid(_index) {
	if (_index >= 0) {
		sprite_delete(_index);
	}
}