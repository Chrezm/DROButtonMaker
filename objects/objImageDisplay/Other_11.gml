/// @description Prepare new image
// You can write your code in this editor
sprite_delete(sprite_index);
multiple_frames = false;

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

preparing_frames = true;
sprite_index = sprLoading;

objFileConverter.source_filename = file;
with objFileConverter {
	event_user(0);
}