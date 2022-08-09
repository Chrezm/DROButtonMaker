if (!surface_exists(cutter_surface)) {
	cutter_surface = surface_create(room_width, room_height);
} else if (surface_get_width(cutter_surface) != room_width || surface_get_height(cutter_surface) != room_height) {
	surface_free(cutter_surface);
	cutter_surface = surface_create(room_width, room_height);
}
surface_set_target(cutter_surface);
draw_clear_alpha(c_white, 0);

if (objController.color == 2 || objController.color >= 5) {
	color = c_black;
} else {
	color = c_white;
}

draw_rectangle_color(x-1, y-1, x+width, y+height, color, color, color, color, 1);
if keyboard_check(vk_control) {
	var guide_color = (current_second % 2 == 0) ? c_black : c_white;
	draw_line_color(x+floor(width/2 - 0.1), y, x+floor(width/2 - 0.1), y+height, guide_color, guide_color);
	draw_line_color(x-1, y+floor(height/2 - 0.1), x+width, y+floor(height/2 - 0.1), guide_color, guide_color);
	draw_line_color(x+floor(width/2), y, x+floor(width/2), y+height, guide_color, guide_color);
	draw_line_color(x-1, y+floor(height/2), x+width, y+floor(height/2), guide_color, guide_color);
}
surface_reset_target();
draw_surface(cutter_surface, 0, 0);

if (to_draw != "") {
	surface_save_part(objImageDisplay.surface, to_draw, x-cam_x(0), y-cam_y(0), width, height);
	if (objButtonGenerator.selected_name != "" and string_pos("_off", objButtonGenerator.target_name) > 0) {
		var to_draw_on = target_button(objImageDisplay, string_replace(objButtonGenerator.target_name, "_off", "_on"), "");
		surface_save_part(objImageDisplay.surface, to_draw_on, x-cam_x(0), y-cam_y(0), width, height);
	}
	objButtonGenerator.character_name = to_draw;
	objButtonGenerator.mode = 1;
	to_draw = "";
}