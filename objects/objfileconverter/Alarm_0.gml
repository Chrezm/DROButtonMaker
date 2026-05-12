/// @description Check if ImageMagick is done

var _fd = file_text_open_read_stdout(process);
var _output = file_text_read_string_stdout(_fd);

if (CompletionStatusFromExecutedProcess(process)) {
	if (_output != "") {
		show_messagebox_async(objMessageBox_Accept, _output);
	}	
	// The last frame file imagemagick generates is garbage, so delete it
	var _count = 0;
	var _file_pattern = string_replace(current_target_filename, ".png", "-*.png");
	var _file = file_find_first(_file_pattern, 0);
	while (_file != "") {
		_count += 1;
		_file = file_find_next();
	}
	file_find_close();
	if (_count > 0) {
		var _garbage_file;	
		_garbage_file = string_replace(current_target_filename, ".png", "-" + string(_count) + ".png");
		file_delete(_garbage_file);
	}	
	event_user(1);
}
else {
	alarm[0] = 10;
}
file_text_close_stdout(_fd);