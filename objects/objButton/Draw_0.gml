/// @description Insert description here
// You can write your code in this editor
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, image_index, xstart + _x, ystart + _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);