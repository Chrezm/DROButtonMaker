/// @description Check if ImageMagick is done

var _fd = file_text_open_read_stdout(process);
var _output = file_text_read_string_stdout(_fd);

if (CompletionStatusFromExecutedProcess(process)) {
	if (_output != "") {
		show_messagebox_async(objMessageBox_Accept, _output);
	}
	event_user(1);
	
	// The last frame file imagemagick generates is garbage, so delete it
	var _garbage_file;
	_garbage_file = string_replace(target_filename, ".png", "-" + string(objImageDisplay.available_frames) + ".png");
	file_delete(_garbage_file);
}
else
{
	alarm[0] = 10;
}
file_text_close_stdout(_fd);