// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function _get_adapted_ini_contents(ini_file) {
	/* The ini parser of GMS is more strict than the one DRO uses.
	 * Therefore, we need to do some magic tricks to get it to work and be read properly.	
	 */
	var file = file_text_open_read(ini_file);
	var raw_text = "";
	var line = "";
	while (!file_text_eof(file)) {
		line = file_text_readln(file);
		if (string_lower(line) == "[emotions]\r\n") {
			// Ini does not specify if section names are case sensitive. GMS currently does.
			line = "[Emotions]\r\n";	
		}
		raw_text = raw_text + line;
	}
	file_text_close(file);
	
	// GMS treats # as newline...
	var ini_text = string_replace_all(raw_text, "#", "<num>");
	// ...but make sure to not escape the actual end of lines.
	ini_text = string_replace_all(ini_text, "\r\n<num>", "\r\n#");
	// GMS does not like double quoted strings.
	ini_text = string_replace_all(ini_text, "\"", "<doublequote>");
	
	return ini_text;	
}

function find_char_ini(emotions) {
	var ini_file;
	ini_file = get_open_filename("ini file|*.ini", "");
	if ini_file == "" {
	    return "";
	}

	var directory = filename_dir(ini_file);
	var ini_text = _get_adapted_ini_contents(ini_file);
	ini_open_from_string(ini_text);

	var i;
	var emotion, full_emotion;
	i = 1;
	emotion = "";
	full_emotion = "";
	while (true) {
	    full_emotion = ini_read_string("Emotions", string(i), "<NONE>")
	    if (full_emotion == "<NONE>") {
	        break;
	    }
		full_emotion = string_replace_all(full_emotion, "<doublequote>", "\"");
	    emotion = string_split(full_emotion, "<num>")[2];
	    ds_map_add(emotions, i, emotion);
	    i += 1;
	}
	
	return directory;
}

function string_split(s, d) {
	var r = array_create(0);
	var p = string_pos(d, s);
	var dl = string_length(d);
	if (dl) while (p) {
	    p -= 1;
	    array_push(r, string_copy(s, 1, p));
	    s = string_delete(s, 1, p + dl);
	    p = string_pos(d, s);
	}
	array_push(r, s);
	return r;
}

function string_startswith(substr, str) {
	return string_pos(substr, str) == 1;
}

function target_button(imageDisplay, name, suffix) {
	name = string_replace_all(name, "<num>", string(imageDisplay.current_index));
	return imageDisplay.target_directory + "\\" + name + suffix + ".png";
}

function draw_scaled(surface, sprite, _x, _y, width, height) {
	surface_set_target(surface);	
	sprite_index = sprite;
	var scale_for_width = width / sprite_width;
	var scale_for_height = height / sprite_height;
	if (scale_for_width == 1 && scale_for_height == 1)
		draw_sprite(sprite_index, image_index, _x, _y);
	else
		better_scaling_draw_sprite(sprite_index, image_index, _x, _y, scale_for_width, scale_for_height, image_angle, image_blend, image_alpha, 1);
	surface_reset_target();
	return;
}

function draw_scaled_from_file(surface, source_file, _x, _y, width, height) {
	var file_sprite = sprite_add(source_file, 1, 0, 0, 0, 0);
	draw_scaled(surface, file_sprite, _x, _y, width, height);
	return file_sprite;
}

function cam_x(num) {
	return camera_get_view_x(view_camera[num]);
}

function cam_y(num) {
	return camera_get_view_y(view_camera[num]);
}

function cam_h(num) {
	return camera_get_view_height(view_camera[num]);
}

function cam_w(num) {
	return camera_get_view_width(view_camera[num]);
}

function pngify(filename) {
	var dir = filename_path(filename);
	
	var converted_file = filename;
	converted_file = string_replace(converted_file, ".webp", ".png");
	converted_file = string_replace(converted_file, ".apng", ".png");
	converted_file = string_replace(converted_file, ".gif", ".png");
	converted_file = string_replace(converted_file, dir, dir + "bmtemp\\");
	return converted_file;	
}

function split_frames(source_filename, target_filename) {
	var dir = filename_path(source_filename);
	directory_create(dir + "bmtemp");
	
	var prog = "ImageMagick\\magick.exe";
	
	var arg = "";
	if (string_count(".apng", source_filename)) {
		arg = "APNG:"
	}
	arg += "\"" + source_filename + "\" -coalesce \"" + target_filename + "\"";
	process = execute_shell(prog, arg);
	return process;
}

function show_messagebox_async(messagebox_type, message) {
	obj = instance_create_depth(x, y, objController.depth-10, messagebox_type);
	obj.text = message;
	obj.has_input_box = false;
	return obj;	
}

function show_inputbox_async(inputbox_type, message, default_value) {
	obj = instance_create_depth(x, y, objController.depth-10, inputbox_type);
	obj.text = message;
	obj.has_input_box = true;
	keyboard_string = string(default_value);
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