/// @description Display new image
// You can write your code in this editor

while (array_length(current_sprites) > 0) {
	var _current_sprite = array_pop(current_sprites);
	sprite_delete_if_valid(_current_sprite);
}
preparing_frames = false;

if (array_length(current_full_filenames) == 0) {
	// This shouldn't happen
	throw ("Empty current full filenames detected when trying to display image");	
}
var _visible_full_filenames = get_visible_full_filenames();
for (var _i = 0; _i < array_length(_visible_full_filenames); _i++) {
	var _filename = _visible_full_filenames[_i];
	if (is_undefined(_filename)) {
		array_push(current_sprites, -1);
		continue;
	}
	var _spr = sprite_add(_filename, 1, 0, 0, 0, 0);
	array_push(current_sprites, _spr);
}
sprite_index = -1;
room_width = cam_w(0);
room_height = cam_h(0);