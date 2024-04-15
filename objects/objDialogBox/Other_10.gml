/// @description Clicked button
if (clicked == 0) {
	throw("Expected clicked button information to be available");
}
switch (clicked) {
	case objDialogButton_Accept:
		event_user(1);
		break;
	case objDialogButton_Reject:
		event_user(2);
		break;
	default:
		throw("Unknown button clicked: " + string(clicked));
}
if (accept_user_input) {
	instance_destroy();
} else {
	image_index = 1;
	alarm[0] = game_get_speed(gamespeed_fps);
	if (has_input_box) {
		with (obj_dialoginput) {
			event_user(0);
		}
	}
}
