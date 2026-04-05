/// @description Read directory
// You can write your code in this editor
ds_map_destroy(emotions);
emotions = ds_map_create();

var _character_registry_file = get_open_filename("character registry files|char.ini;char.json", "");
if (_character_registry_file == "") {
	show_messagebox_async(
		objMessageBox_ChariniFail,
		"No character registry file selected.\nTry again?"
	);
	exit;
}

var _current_directory = filename_dir(_character_registry_file);
if (string_startswith(program_directory, _current_directory)) {
	show_messagebox_async(
		objMessageBox_ChariniFail,
		"Character folder may not be located\nwithin the application folder.\nTry again?"
	);
	exit;
}

if (string_ends_with(_character_registry_file, ".ini")) {
	parse_char_ini(emotions, _character_registry_file);
	objButtonGenerator.default_target_name = "button<num>_off";
	objButtonGenerator.target_name = "button<num>_off";
} else if (string_ends_with(_character_registry_file, ".json")) {
	parse_char_json(emotions, _character_registry_file);
	objButtonGenerator.default_target_name = "<name>";
	objButtonGenerator.target_name = "<name>";
} else {
	show_messagebox_async(
		objMessageBox_ChariniFail,
		"Unrecognized kind of character registry file selected.\nTry again?"
	);
	exit;
}
if (ds_map_empty(emotions)) {
	// Shouldn't happen unless this character registry literally defines 
	// no sprites.
	show_messagebox_async(
		objMessageBox_ChariniFail,
		"Character registry defines no sprites.\nTry again?"
	);	
	exit;
}

current_directory = _current_directory;
current_index = 1;
current_emote = ds_map_find_value(emotions, current_index);
create_target_button_directories(emotions, current_directory);
event_user(1);

if !instance_exists(objCutter) {
	instance_create_depth(0, 0, depth-1, objCutter);
}
objCutter.x = round((room_width - objCutter.width)/2);
camera_set_view_pos(view_camera[0], (room_width - cam_w(0))/2, 0);

