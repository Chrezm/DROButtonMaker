/// @description Insert description here
// You can write your code in this editor
if (mode == 1 or mode == 2) {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	scale_for_40 = 40 / sprite_width;
	better_scaling_draw_sprite(sprite_index, image_index, _x, _y, scale_for_40, scale_for_40, image_angle, image_blend, image_alpha, 1);
}
if (mode == 1) {
	mode = 2;
	alarm[0] = 2;
}