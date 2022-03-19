/// @description Generate button

if (current_directory == "") {
	exit;
}

with objPreview {
	event_user(1);
}

objFrame.to_draw = target_button(self, "_off");
alarm[0] = 10;