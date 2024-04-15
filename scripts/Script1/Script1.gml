// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function _get_adapted_ini_contents(_ini_file) {
	/* The ini parser of GMS is more strict than the one DRO uses.
	 * Therefore, we need to do some magic tricks to get it to work and be read properly.	
	 */
	var _file = file_text_open_read(_ini_file);
	var _raw_text = "";
	var _line = "";
	while (!file_text_eof(_file)) {
		_line = file_text_readln(_file);
		if (string_lower(_line) == "[emotions]\r\n") {
			// Ini does not specify if section names are case sensitive. GMS currently does.
			_line = "[Emotions]\r\n";
		}
		_raw_text = _raw_text + _line;
	}
	file_text_close(_file);
	
	// GMS treats # as newline...
	var _ini_text = string_replace_all(_raw_text, "#", "<num>");
	// ...but make sure to not escape the actual end of lines.
	_ini_text = string_replace_all(_ini_text, "\r\n<num>", "\r\n#");
	// GMS does not like double quoted strings.
	_ini_text = string_replace_all(_ini_text, "\"", "<doublequote>");
	
	return _ini_text;
}

function find_char_ini(_emotions) {
	var _ini_file;
	_ini_file = get_open_filename("ini file|*.ini", "");
	if _ini_file == "" {
	    return "";
	}

	var _directory = filename_dir(_ini_file);
	var _ini_text = _get_adapted_ini_contents(_ini_file);
	ini_open_from_string(_ini_text);

	var _i;
	var _emotion, _full_emotion;
	_i = 1;
	_emotion = "";
	_full_emotion = "";
	while (true) {
	    _full_emotion = ini_read_string("Emotions", string(_i), "<NONE>")
	    if (_full_emotion == "<NONE>") {
	        break;
	    }
		_full_emotion = string_replace_all(_full_emotion, "<doublequote>", "\"");
	    _emotion = string_split(_full_emotion, "<num>")[2];
	    ds_map_add(_emotions, _i, _emotion);
	    _i += 1;
	}
	
	return _directory;
}

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

function target_button(_obj_image_display, _name, _suffix) {
	_name = string_replace_all(_name, "<num>", string(_obj_image_display.current_index));
	return _obj_image_display.target_directory + "\\" + _name + _suffix + ".png";
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

function pngify(_filename) {
	var _dir = filename_path(_filename);
	
	var _converted_file = _filename;
	_converted_file = string_replace(_converted_file, ".webp", ".png");
	_converted_file = string_replace(_converted_file, ".apng", ".png");
	_converted_file = string_replace(_converted_file, ".gif", ".png");
	_converted_file = string_replace(_converted_file, _dir, _dir + "bmtemp\\");
	return _converted_file;
}

function split_frames(_source_filename, _target_filename) {
	var _dir = filename_path(_source_filename);
	directory_create(_dir + "bmtemp");
	
	var _prog = "ImageMagick\\magick.exe";
	
	var _arg = "";
	if (string_count(".apng", _source_filename)) {
		_arg = "APNG:"
	}
	_arg += "\"" + _source_filename + "\" -coalesce \"" + _target_filename + "\"";
	var _process = execute_shell(_prog, _arg);
	return _process;
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