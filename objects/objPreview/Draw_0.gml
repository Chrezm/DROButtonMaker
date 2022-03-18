/// @description Insert description here
// You can write your code in this editor
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 40;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 40;

if (filename != "") {
	draw_sprite(sprite_index, image_index, _x, _y);
}