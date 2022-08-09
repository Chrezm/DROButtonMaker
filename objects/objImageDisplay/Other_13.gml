/// @description Generate button

if (current_directory == "") {
	exit;
}

with objPreview {
	event_user(1);
}

objCutter.to_draw = target_button(self, objButtonGenerator.target_name, "");
alarm[0] = 10;