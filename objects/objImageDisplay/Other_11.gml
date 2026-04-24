/// @description Prepare new image
// You can write your code in this editor

multiple_frames = false;
current_frame = 0;
available_frames = 1;
current_full_filenames = array_create(0);

if (array_length(current_emote.components) == 0) {
	exit;
}

var _full_filenames = array_create(0);
var _full_filenames_to_convert = array_create(0);
for (var _i = 0; _i < array_length(current_emote.components); _i++) {
	var _result = find_path_2(
		current_directory, 
		current_emote.outfit_directory,
		current_emote.components[_i]
	);
	var _file = _result[0];
	array_push(_full_filenames, _file);
	var _needs_conversion = _result[1];
	if (_needs_conversion) {
		array_push(_full_filenames_to_convert, _file);
	}
}
	

if (array_length(_full_filenames_to_convert) == 0) {
	current_full_filenames = _full_filenames;
	event_user(2);
	exit;
}

// Prepare for multiple frame image
while (array_length(current_sprites) > 0) {
	var _current_sprite = array_pop(current_sprites);
	sprite_delete_if_valid(_current_sprite);
}
preparing_frames = true;
sprite_index = sprLoading;

objFileConverter.full_filenames = _full_filenames;
objFileConverter.full_filenames_to_convert = array_create(0);
array_copy(objFileConverter.full_filenames_to_convert, 0, _full_filenames_to_convert, 0, array_length(_full_filenames_to_convert));
with objFileConverter {
	event_user(0);
}