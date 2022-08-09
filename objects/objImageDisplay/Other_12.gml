/// @description Display new image
// You can write your code in this editor

var spr;

spr = sprite_add(current_full_filename, 1, 0, 0, 0, 0);
sprite_index = spr;
room_width = max(cam_w(0), sprite_width);
room_height = max(cam_h(0), sprite_height);