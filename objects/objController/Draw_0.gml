
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, colors[color]);

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

draw_text(_x, _y +_gap*0, "Current basic file: " + string(objImageDisplay.current_index) + " " + objImageDisplay.current_filename);
if (objImageDisplay.preparing_frames) {
	draw_text(_x, _y + _gap*1, "Current shown file: None");
} else {
	var _shown_file = string_replace(objImageDisplay.current_full_filename, objImageDisplay.current_directory, "");
	_shown_file = string_delete(_shown_file, 1, 1);
	_shown_file = string_replace_all(_shown_file, "\\", "/");
	draw_text(_x, _y + _gap*1, "Current shown file: " + _shown_file);
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