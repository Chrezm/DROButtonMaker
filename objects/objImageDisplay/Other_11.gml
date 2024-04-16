/// @description Prepare new image
// You can write your code in this editor

multiple_frames = false;
current_frame = 0;
available_frames = 1;

var _file;
var _use_magick = true;
var _found = false;

for (var _i = 0; _i < array_length(lookup_prefixes); _i++) {
	var _lookup_prefix = lookup_prefixes[_i];
	for (var _j = 0; _j < array_length(lookup_suffixes); _j++) {
		var _lookup_suffix = lookup_suffixes[_j];
		_file = current_directory + _lookup_prefix + current_filename + _lookup_suffix;
		if (file_exists(_file)) {
			_found = true;
			_use_magick = (_lookup_suffix == ".png");
			break;
		}
	}
	if (_found) {
		break;
	}
}

if (_use_magick) {
	current_full_filename = _file;
	event_user(2);
	exit;
}

// Prepare for multiple frame image
sprite_delete_if_valid(sprite_index);
preparing_frames = true;
sprite_index = sprLoading;

objFileConverter.source_filename = _file;
with objFileConverter {
	event_user(0);
}