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
			components: array_create(0),
			parent_directory: _parent_directory,
			outfit_directory: "",
			target_button_directory: "emotions",
		};
		var _component = {
			stem: _emote_stem,
			layer_name: "",
		};
		array_push(_emote.components, _component);
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
	
	for (var _i = 0; _i < array_length(_system_outfits); _i++) {
		var _system_outfit = array_get(_system_outfits, _i);
		if (array_contains(_outfit_order, _system_outfit)) {
			continue;
		}
		array_push(_other_outfits, _system_outfit);
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
		var _layers = _outfit_json.layers;
		var _starting_size = ds_map_size(_emotions);
		for (var _j = 0; _j < array_length(_emotes); _j++) {
			var _json_emote = array_get(_emotes, _j);
			var _emote_name = _json_emote.name;
			var _emote_stem = struct_exists(_json_emote , "image") ? _json_emote .image : _emote_name;
			var _final_emote_index = _starting_size + _j + 1;
			var _outfit_directory = "outfits/" + _outfit;
			var _target_button_directory = _outfit_directory + "/emotions";
			var _emote = {
				name: _emote_name,
				parent_directory: "",
				outfit_directory: _outfit_directory,
				components: array_create(0),
				target_button_directory: _target_button_directory,
			};
			var _component = {
				stem: _emote_stem,
				layer_name: "",
			}
			array_push(_emote.components, _component);
			for (var _k = 0; _k < array_length(_layers); _k++) {
				var _layer_name = _layers[_k].name;
				if (struct_exists(_json_emote, _layer_name)) {
					_emote_stem = struct_get(_json_emote, _layer_name);
					_component = {
						stem: _emote_stem,
						layer_name: _layer_name,
					}
					array_push(_emote.components, _component)
				}
			}
			ds_map_add(_emotions, _final_emote_index, _emote);		
		}
	}
	show_debug_message(_emotions);
}

function directory_nonempty(_path) {
	if (!directory_exists(_path)) {
		return false;
	}
	var _file = file_find_first(_path + "/*", fa_none);
	var _output = (_file != "");
	file_find_close();
	return _output;
}

function create_target_button_directories(_emotions, _current_directory) {
	var _target_button_directories_created = ds_map_create();
	for (var _i = 1; _i <= ds_map_size(_emotions); _i++) {
		var _emote = ds_map_find_value(_emotions, _i);
		var _candidate_target_button_directory = _current_directory + "/" + _emote.target_button_directory;
		if (ds_map_exists(_target_button_directories_created, _candidate_target_button_directory)) {
			continue;
		}
		if (directory_nonempty(_candidate_target_button_directory)) {
			_candidate_target_button_directory += "2";
			_emote.target_button_directory += "2";
		}
		directory_create(_candidate_target_button_directory);
		ds_map_set(_target_button_directories_created, _candidate_target_button_directory, true);
	}
	ds_map_destroy(_target_button_directories_created);
}

function target_button(_obj_image_display, _name, _suffix) {
	var _emote = ds_map_find_value(_obj_image_display.emotions, _obj_image_display.current_index);
	_name = string_replace_all(_name, "<num>", string(_obj_image_display.current_index));
	_name = string_replace_all(_name, "<name>", string(_emote.name));
	return _obj_image_display.current_directory + "/" + _emote.target_button_directory + "/" + _name + _suffix + ".png";
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

#macro lookup_prefixes ["/(a)", "/(a)/", "/"]
#macro lookup_suffixes [".webp", ".apng", ".gif", ".png"]

function find_path(_current_directory, _path_minus_extension) {
	for (var _i = 0; _i < array_length(lookup_prefixes); _i++) {
		var _lookup_prefix = lookup_prefixes[_i];
		for (var _j = 0; _j < array_length(lookup_suffixes); _j++) {
			var _lookup_suffix = lookup_suffixes[_j];
			var _file = _current_directory + _lookup_prefix + _path_minus_extension + _lookup_suffix;
			if (file_exists(_file)) {
				return [_file, (_lookup_suffix != ".png")];
			}
		}
	}
	return [undefined, false];
}

// This is from DRO
function build_paths(_base_path, _outfit_path, _subfolder, _image_name) {
	var _output = array_create(0);
	for (var _i = 0; _i < array_length(lookup_prefixes); _i++) {
		var _prefix = lookup_prefixes[_i] + _image_name;
		_output = array_concat(_output, [
			_base_path + "/" + _outfit_path + "/" + _prefix,
			_base_path + "/" + _outfit_path + "/" + _subfolder + "/" + _prefix,
			_outfit_path + "/" + _prefix,
			_outfit_path + "/" + _subfolder + "/" + _prefix,
			_base_path + "/" + _prefix,
			_base_path + "/" + _subfolder + "/" + _prefix,
		]);
	}
	return _output;
}

function find_file(_file_paths) {
	for (var _i = 0; _i < array_length(_file_paths); _i++) {
		var _file_path = _file_paths[_i];
		for (var _j = 0; _j < array_length(lookup_suffixes); _j++) {
			var _lookup_suffix = lookup_suffixes[_j];
			var _file = _file_path + _lookup_suffix;
			if (file_exists(_file)) {
				return [_file, (_lookup_suffix != ".png")];
			}
		}
	}
	return [undefined, false];
}

function find_path_2(_current_directory, _outfit_directory, _current_emote_component) {
	var _file_paths = build_paths(_current_directory, _outfit_directory, _current_emote_component.layer_name, _current_emote_component.stem);
	return find_file(_file_paths);
}