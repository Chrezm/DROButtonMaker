
var _lay_id = layer_get_id("Background");
var _back_id = layer_background_get_id(_lay_id);
layer_background_blend(_back_id, colors[color]);

if (objImageDisplay.current_directory == "") {
	exit;
}

var _x = cam_x(0);
var _y = cam_y(0);

if (color == 2 || color >= 5) {
	draw_set_color(c_black);
} else {
	draw_set_color(c_white);
}

var _gap = 20;

var _basic_file = string(objImageDisplay.current_index);
if (objImageDisplay.current_emote.name != "") {
	_basic_file = _basic_file + ". " + objImageDisplay.current_emote.name;
}
if (array_length(objImageDisplay.current_emote.components) > 0) {
	_basic_file = _basic_file + ": " + objImageDisplay.current_emote.components[0].stem;
	for (var _i = 1; _i < array_length(objImageDisplay.current_emote.components); _i++) {
		_basic_file = _basic_file + " + " + objImageDisplay.current_emote.components[_i].stem;
	}
}

draw_text(_x, _y +_gap*0, "Current basic file: " + _basic_file);
if (objImageDisplay.preparing_frames || array_length(objImageDisplay.current_full_filenames) == 0) {
	draw_text(_x, _y + _gap*1, "Current shown file: None");
} else {
	var _shown_file_text = "";
	var _outfit_directory = objImageDisplay.current_emote.outfit_directory;
	if (_outfit_directory != "") {
		_outfit_directory = format_path(objImageDisplay.current_emote.outfit_directory);
		_shown_file_text = $"[{string_replace(_outfit_directory, "outfits/", "")}] ";
	}
	
	var _shown_files = [];
	var _visible_full_filenames = get_visible_full_filenames();
	for (var _i = 0; _i < array_length(_visible_full_filenames); _i++) {
		var _shown_file = _visible_full_filenames[_i];
		if (is_undefined(_shown_file)) {
			continue;
		}
		_shown_file = string_replace(_shown_file, objImageDisplay.current_directory, "");
		_shown_file = format_path(string_replace(format_path(_shown_file), _outfit_directory, ""));
		array_push(_shown_files, _shown_file);
	}
	if (array_length(_shown_files) == 0) {
		_shown_file_text = _shown_file_text + "None";	
	} else {
		for (var _i = 0; _i < array_length(_shown_files); _i++) {
			_shown_file_text = 	_shown_file_text + $"{_shown_files[_i]} + "
		}
		_shown_file_text = string_copy(_shown_file_text, 0, string_length(_shown_file_text)-3);
	}
	draw_text(_x, _y + _gap*1, "Current shown file: " + _shown_file_text);
}

draw_text(_x, _y + _gap*2, "Current target name: " + objButtonGenerator.target_name);
draw_text(_x, _y + _gap*3, "Current target size: " + string(objButtonGenerator.target_size));

if (objButtonGenerator.background_name == "") {
	draw_text(_x, _y + _gap*4, "Current bg: None");
} else {
	draw_text(_x, _y + _gap*4, "Current bg: " + filename_name(objButtonGenerator.background_name));
}
if (objButtonGenerator.foreground_name == "") {
	draw_text(_x, _y + _gap*5, "Current fg: None");
} else {
	draw_text(_x, _y + _gap*5, "Current fg: " + filename_name(objButtonGenerator.foreground_name));
}
if (objButtonGenerator.selected_name == "") {
	draw_text(_x, _y + _gap*6, "Current selected: None");
} else {
	draw_text(_x, _y + _gap*6, "Current selected: " + filename_name(objButtonGenerator.selected_name));
}
if (objButtonGenerator.mask_name == "") {
	draw_text(_x, _y + _gap*7, "Current mask: None");
} else {
	draw_text(_x, _y + _gap*7, "Current mask: " + filename_name(objButtonGenerator.mask_name));
}

draw_text(_x, _y + _gap*9, "Size of cutter: " + string(objCutter.width));
draw_text(_x, _y + _gap*10, "x coordinate of cutter: " + string(objCutter.x));
draw_text(_x, _y + _gap*11, "y coordinate of cutter: " + string(objCutter.y));

if (objImageDisplay.multiple_frames) {
	draw_text(_x + 100, _y + 300, "Frame: " + string(objImageDisplay.current_frame) + "/" + string(objImageDisplay.available_frames - 1));
}