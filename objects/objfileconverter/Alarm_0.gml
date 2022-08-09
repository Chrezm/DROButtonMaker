/// @description Check if ImageMagick is done

var fd = file_text_open_read_stdout(process);
var output = file_text_read_string_stdout(fd);

if (CompletionStatusFromExecutedProcess(process)) {
	if (output != "") {
		show_message(output);
	}
	event_user(1);
}
else
{
	alarm[0] = 10;
}
file_text_close_stdout(fd);