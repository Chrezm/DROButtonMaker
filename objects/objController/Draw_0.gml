if (objImageDisplay.current_directory == "") {
	exit;
}

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
var _gap = 32;
draw_text(_x, _y +_gap*0, "Current file: " + string(objImageDisplay.current_index) + " " + objImageDisplay.current_filename);
if (objPreviewGenerator.background_name == "") {
	draw_text(_x, _y + _gap*1, "Current bg: None");
} else {
	draw_text(_x, _y + _gap*1, "Current bg: " + filename_name(objPreviewGenerator.background_name));
}

draw_text(_x, _y +_gap*4, "Size of frame: " + string(objFrame.width));
draw_text(_x, _y +_gap*5, "x coordinate of frame: " + string(objFrame.x));
draw_text(_x, _y +_gap*6, "y coordinate of frame: " + string(objFrame.y));

