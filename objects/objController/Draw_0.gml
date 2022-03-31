
lay_id = layer_get_id("Background");
back_id = layer_background_get_id(lay_id);
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

var _gap = 32;
draw_text(_x, _y +_gap*0, "Current file: " + string(objImageDisplay.current_index) + " " + objImageDisplay.current_filename);
draw_text(_x, _y + _gap*1, "Current target name: " + objButtonGenerator.target_name);
draw_text(_x, _y + _gap*2, "Current target size: " + string(objButtonGenerator.target_size));
if (objButtonGenerator.background_name == "") {
	draw_text(_x, _y + _gap*3, "Current bg: None");
} else {
	draw_text(_x, _y + _gap*3, "Current bg: " + filename_name(objButtonGenerator.background_name));
}
if (objButtonGenerator.foreground_name == "") {
	draw_text(_x, _y + _gap*4, "Current fg: None");
} else {
	draw_text(_x, _y + _gap*4, "Current fg: " + filename_name(objButtonGenerator.foreground_name));
}
if (objButtonGenerator.selected_name == "") {
	draw_text(_x, _y + _gap*5, "Current selected: None");
} else {
	draw_text(_x, _y + _gap*5, "Current selected: " + filename_name(objButtonGenerator.selected_name));
}
if (objButtonGenerator.mask_name == "") {
	draw_text(_x, _y + _gap*6, "Current mask: None");
} else {
	draw_text(_x, _y + _gap*6, "Current mask: " + filename_name(objButtonGenerator.mask_name));
}

draw_text(_x, _y + _gap*8, "Size of frame: " + string(objFrame.width));
draw_text(_x, _y + _gap*9, "Left coordinate of frame: " + string(objFrame.x));
draw_text(_x, _y + _gap*10, "Top coordinate of frame: " + string(objFrame.y));

