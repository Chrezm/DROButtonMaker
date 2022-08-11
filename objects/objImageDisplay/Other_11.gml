/// @description Prepare new image
// You can write your code in this editor

multiple_frames = false;
current_frame = 0;
available_frames = 1;

var file;
var use_magick = true;

var i, j;
var found = false;

for (i = 0; i < array_length(lookup_prefixes); i++) {
	lookup_prefix = lookup_prefixes[i];
	for (j = 0; j < array_length(lookup_suffixes); j++) {
		lookup_suffix = lookup_suffixes[j];
		file = current_directory + lookup_prefix + current_filename + lookup_suffix;
		if (file_exists(file)) {
			found = true;
			use_magick = (lookup_suffix == ".png");
			break;
		}
	}
	if (found) {
		break;
	}
}

if (use_magick) {
	current_full_filename = file;
	event_user(2);
	exit;
}

// Prepare for multiple frame image
sprite_delete(sprite_index);
preparing_frames = true;
sprite_index = sprLoading;

objFileConverter.source_filename = file;
with objFileConverter {
	event_user(0);
}