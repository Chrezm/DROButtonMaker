/// @description Check if ImageMagick is done

var fd = file_text_open_read_stdout(process);
var output = file_text_read_string_stdout(fd);

if (CompletionStatusFromExecutedProcess(process)) {
	if (output != "") {
		show_messagebox_async(objMessageBox_Accept, output);
	}
	event_user(1);
	
	// The last frame file imagemagick generates is garbage, so delete it
	var garbage_file;
	garbage_file = string_replace(target_filename, ".png", "-" + string(objImageDisplay.available_frames) + ".png");
	file_delete(garbage_file);
}
else
{
	alarm[0] = 10;
}
file_text_close_stdout(fd);