/// @description Prepare new image
// You can write your code in this editor

multiple_frames = false;
current_frame = 0;
available_frames = 1;

var file;
var is_png = false;

file = current_directory + "\\" + current_filename + ".webp";
if (!file_exists(file)) {
	file = current_directory + "\\" + current_filename + ".apng";
	if (!file_exists(file)) {
		file = current_directory + "\\" + current_filename + ".gif";
		if (!file_exists(file)) {
			file = current_directory + "\\" + current_filename + ".png";
			is_png = true;
		}
	}
}

if (is_png) {
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