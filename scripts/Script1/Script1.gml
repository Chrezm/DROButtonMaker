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

function parse_char_ini(_emotions, _ini_file) {
	var _ini_text = _get_adapted_ini_contents(_ini_file);
	ini_open_from_string(_ini_text);

	var _i;
	_i = 1;
	while (true) {
	    var _emotion_line = ini_read_string("Emotions", string(_i), "<NONE>")
	    if (_emotion_line == "<NONE>") {
	        break;
	    }
		_emotion_line = string_replace_all(_emotion_line, "<doublequote>", "\"");
		_emotion_line = string_replace_all(_emotion_line, "\\", "/");
		var _emote_name = string_split(_emotion_line, "<num>")[0];
	    var _path_minus_extension = string_split(_emotion_line, "<num>")[2];
		var _parent_directory = "";
		var _emote_stem = "";
		var _parent_directory_delimiter_index = string_last_pos("/", _path_minus_extension);
		if (_parent_directory_delimiter_index != 0) {
			_parent_directory = string_copy(_path_minus_extension, 1, _parent_directory_delimiter_index - 1);
			_emote_stem = string_copy(_path_minus_extension, _parent_directory_delimiter_index + 1, 
			  string_length(_path_minus_extension) - _parent_directory_delimiter_index);
		} else {
			_parent_directory = "";
			_emote_stem = _path_minus_extension;
		}		
		var _emote = {
			name: _emote_name,
			stem: _emote_stem,
			parent_directory: _parent_directory,
			path_minus_extension: _path_minus_extension,
			target_button_directory: "emotions"
		};
	    ds_map_add(_emotions, _i, _emote);
	    _i += 1;
	}
}

function _get_outfits(_directory, _char_json) {
	var _system_outfits = [];
	
	// The output of this function is a sublist of all the outfits in the outfits directory
	var _folder_name = file_find_first(_directory + "\\outfits\\*", fa_directory);
	while (_folder_name != "") {
		array_push(_system_outfits, _folder_name);
		_folder_name = file_find_next();
	}
	file_find_close();
	if (array_length(_system_outfits) == 0) {
		return _system_outfits;
	}
	
	// We then look for a specific ordering of the outfits, defaulting to what we have
	// if not given a specific ordering
	if (!struct_exists(_char_json, "outfit_order")) {
		return _system_outfits;
	}
	
	// If we have outfits, we return an array containing,
	// 1. _outfit_order, followed by
	// 2. The outfits in _system_outfits not in _outfit_order, in alphabetical order
	var _outfit_order = _char_json.outfit_order;
	var _other_outfits = [];
	
	for (var _i = 0; _i < array_length(_outfit_order); _i++) {
		var _ordered_outfit = array_get(_outfit_order, _i);
		if (array_contains(_system_outfits, _ordered_outfit)) {
			continue;
		}
		array_push(_other_outfits, _ordered_outfit);
	}
	return array_concat(_outfit_order, _other_outfits);
}

function parse_char_json(_emotions, _json_file) {
	var _char_json = json_load(_json_file);
	if (is_undefined(_char_json)) {
		return;
	}
	var _directory = filename_dir(_json_file);
	var _outfits = _get_outfits(_directory, _char_json);
	if (array_length(_outfits) == 0) {
		return;
	}
	for (var _i = 0; _i < array_length(_outfits); _i++) {
		var _outfit = array_get(_outfits, _i);
		show_debug_message(_outfit);
		var _outfit_file_path = _directory + "/outfits/" + _outfit + "/outfit.json";
		var _outfit_json = json_load(_outfit_file_path);
		if (is_undefined(_outfit_json)) {
			continue;	
		}
		show_debug_message(_outfit_json);
		var _emotes = _outfit_json.emotes;
		if (array_length(_emotes) == 0) {
			return;
		}
		var _starting_size = ds_map_size(_emotions);
		for (var _j = 0; _j < array_length(_emotes); _j++) {
			var _json_emote = array_get(_emotes, _j);
			var _emote_name = _json_emote.name;
			var _emote_stem = struct_exists(_json_emote , "image") ? _json_emote .image : _emote_name;
			var _final_emote_index = _starting_size + _j + 1;
			var _parent_directory = "outfits/" + _outfit;
			var _target_button_directory = _parent_directory + "/emotions";
			var _emote = {
				name: _emote_name,
				stem: _emote_stem,
				parent_directory: _parent_directory,
				path_minus_extension: _parent_directory + "/" + _emote_stem,
				target_button_directory: _target_button_directory
			};
			ds_map_add(_emotions, _final_emote_index, _emote);		
		}
	}
}

function create_target_button_directories(_emotions, _current_directory) {
	var _target_button_directories_created = ds_map_create();
	for (var _i = 1; _i <= ds_map_size(_emotions); _i++) {
		var _emote = ds_map_find_value(_emotions, _i);
		var _candidate_target_button_directory = _current_directory + "/" + _emote.target_button_directory;
		if (ds_map_exists(_target_button_directories_created, _candidate_target_button_directory)) {
			continue;
		}
		if (directory_exists(_candidate_target_button_directory)) {
			_candidate_target_button_directory += "2";
			_emote.target_button_directory += "2";
		}
		directory_create(_candidate_target_button_directory);
		ds_map_set(_target_button_directories_created, _candidate_target_button_directory, true);
	}
	ds_map_destroy(_target_button_directories_created);
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
	var _emote = ds_map_find_value(_obj_image_display.emotions, _obj_image_display.current_index);
	_name = string_replace_all(_name, "<num>", string(_obj_image_display.current_index));
	_name = string_replace_all(_name, "<name>", string(_emote.name));
	return _obj_image_display.current_directory + "/" + _emote.target_button_directory + "/" + _name + _suffix + ".png";
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