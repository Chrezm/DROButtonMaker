/// @description Generate button

if (current_directory == "") {
	exit;
}

with objPreview {
	event_user(1);
}

objFrame.to_draw = target_button(self, "");
alarm[0] = 2;