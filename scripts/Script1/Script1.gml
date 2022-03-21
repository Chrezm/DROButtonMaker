// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function find_char_ini(mapEmotions) {
	var ini_file;
	ini_file = get_open_filename("ini file|*.ini", "");
	if ini_file == "" {
	    return "";
	}

	var directory = filename_dir(ini_file);
	
	var file = file_text_open_read(ini_file);
	var raw_text = "";
	while (!file_text_eof(file)) {
		raw_text = raw_text + file_text_readln(file);
	}
	file_text_close(file);
	var ini_text = string_replace_all(raw_text, "#", "|");
	ini_text = string_replace_all(ini_text, "\r\n|", "\r\n#");
	
	ini_open_from_string(ini_text);

	var i;
	var emotion, full_emotion;
	i = 1;
	emotion = "";
	full_emotion = "";
	while (true) {
	    full_emotion = ini_read_string("Emotions", string(i), "<NONE>")
	    if (full_emotion == "<NONE>") {
	        return directory;
	    }
	    emotion = string_split(full_emotion, "|")[2];
	    ds_map_add(mapEmotions, i, emotion);
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

