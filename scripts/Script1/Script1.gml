// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_files(fArray){
	var sample_file;
	sample_file = get_open_filename("image file|*.png", "");
	if sample_file == "" {
	    return "";
	}

	var directory;
	directory = filename_dir(sample_file);

	var fileName;
	fileName = file_find_first(directory + "\*.png", fa_directory);

	while (fileName != "") {
	    if (fileName != "char_icon.png") {
	        ds_list_add(fArray, fileName);
	    }
	    fileName = file_find_next();
	}

	file_find_close();
	return directory;
}

function find_char_ini(mapEmotions) {
	var ini_file;
	ini_file = get_open_filename("ini file|*.ini", "");
	if ini_file == "" {
	    return "";
	}

	ini_open(ini_file);

	var i;
	var emotion, full_emotion;
	i = 1;
	emotion = "";
	full_emotion = "";
	while (true) {
	    full_emotion = ini_read_string("Emotions", string(i), "<NONE>")
	    if (full_emotion == "<NONE>") {
	        return ini_file;
	    }
	    //emotion = string_split(full_emotion, "#");
	    ds_map_add(mapEmotions, i, full_emotion);
	    i += 1;
	}
	
	return ini_file;
}

function string_split(s, d) {
	var r = ds_list_create();
	var p = string_pos(d, s);
	var dl = string_length(d);
	if (dl) while (p) {
	    p -= 1;
	    ds_list_add(r, string_copy(s, 1, p));
	    s = string_delete(s, 1, p + dl);
	    p = string_pos(d, s);
	}
	ds_list_add(r, s);
	return r;
}