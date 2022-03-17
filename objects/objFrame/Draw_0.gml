draw_rectangle_color(x, y, x+width, y+height, color, color, color, color, 1);
if keyboard_check(vk_control) {
	draw_line_color(x+width/2, y, x+width/2, y+height, c_black, c_black);
}