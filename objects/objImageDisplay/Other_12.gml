/// @description Display new image
// You can write your code in this editor

if (sprite_index != sprLoading) {
	sprite_delete_if_valid(sprite_index);
}
preparing_frames = false;

var _spr;

_spr = sprite_add(current_full_filename, 1, 0, 0, 0, 0);
sprite_index = _spr;
room_width = cam_w(0);
room_height = cam_h(0);