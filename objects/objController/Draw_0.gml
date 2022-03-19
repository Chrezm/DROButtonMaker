if (objImageDisplay.current_directory == "") {
	exit;
}

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _gap = 32;
draw_text(_x, _y +_gap*0, "Current file: " + string(objImageDisplay.current_index) + " " + objImageDisplay.current_filename);
if (objButtonGenerator.background_name == "") {
	draw_text(_x, _y + _gap*1, "Current bg: None");
} else {
	draw_text(_x, _y + _gap*1, "Current bg: " + filename_name(objButtonGenerator.background_name));
}
if (objButtonGenerator.foreground_name == "") {
	draw_text(_x, _y + _gap*2, "Current fg: None");
} else {
	draw_text(_x, _y + _gap*2, "Current fg: " + filename_name(objButtonGenerator.foreground_name));
}
if (objButtonGenerator.selected_name == "") {
	draw_text(_x, _y + _gap*3, "Current selected: None");
} else {
	draw_text(_x, _y + _gap*3, "Current selected: " + filename_name(objButtonGenerator.selected_name));
}
draw_text(_x, _y + _gap*4, "Current target size: " + string(objButtonGenerator.target_size));

draw_text(_x, _y + _gap*5, "Size of frame: " + string(objFrame.width));
draw_text(_x, _y + _gap*6, "Left coordinate of frame: " + string(objFrame.x));
draw_text(_x, _y + _gap*7, "Right coordinate of frame: " + string(objFrame.y));

