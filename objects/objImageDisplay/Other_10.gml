/// @description Read directory
// You can write your code in this editor
mapEmotions = ds_map_create();
var _current_directory;

_current_directory = find_char_ini(mapEmotions);
if (_current_directory == "") {
	show_messagebox_async(
		objMessageBox_ChariniFail,
		"No char.ini selected.\nTry again?"
	);
	exit;
}
if (string_startswith(program_directory, _current_directory)) {
	show_messagebox_async(
		objMessageBox_ChariniFail,
		"Character folder may not be located\nwithin the application folder.\nTry again?"
	);
	exit;
}

current_directory = _current_directory;
current_index = 1;
current_filename = ds_map_find_value(mapEmotions, current_index);

event_user(1);

if !instance_exists(objCutter) {
	instance_create_depth(0, 0, depth-1, objCutter);
}
objCutter.x = round((room_width - objCutter.width)/2);
camera_set_view_pos(view_camera[0], (room_width - cam_w(0))/2, 0);

if !directory_exists(current_directory + "\\emotions") {
	target_directory = current_directory + "\\emotions";
	directory_create(target_directory);
} else {
	target_directory = current_directory + "\\emotions2";
	if !directory_exists(current_directory + "\\emotions2") {
		directory_create(target_directory);
	}
}
