draw_rectangle_color(x, y, x+width, y+height, color, color, color, color, 1);
if keyboard_check(vk_control) {
	var guide_color = (current_second % 2 == 0) ? c_black : c_white;
	draw_line_color(x+width/2, y, x+width/2, y+height, guide_color, guide_color);
	draw_line_color(x, y+height/2, x+width, y+height/2, guide_color, guide_color);
}

if (to_draw != "") {
	surface_save_part(objImageDisplay.surface, to_draw, x-camera_get_view_x(view_camera[0]), y-camera_get_view_y(view_camera[0]), width, height);

	objPreviewGenerator.filename = to_draw;
	objPreviewGenerator.mode = 1;
	to_draw = "";
}