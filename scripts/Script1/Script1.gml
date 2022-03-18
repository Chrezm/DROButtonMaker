// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function find_char_ini_2(mapEmotions) {
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

function target_button(imageDisplay, suffix) {
	return imageDisplay.target_directory + "\\button" + string(imageDisplay.current_index) + suffix + "_off.png";
}

function draw_scaled(surface, filename) {
	surface_set_target(surface);	
	var character_sprite = sprite_add(filename, 1, 0, 0, 0, 0);
	sprite_index = character_sprite;
	var scale_for_40 = 40 / sprite_width;
	better_scaling_draw_sprite(sprite_index, image_index, 0, 0, scale_for_40, scale_for_40, image_angle, image_blend, image_alpha, 1);
	sprite_delete(character_sprite);
	surface_reset_target();
}
