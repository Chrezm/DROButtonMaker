/// @description Clicked Accept
var raw_target_size = string_digits(user_text);
if (user_text == "" || raw_target_size != string(user_text)) {
	accept_user_input = false;
	exit;
}

var target_size = 0;
target_size = real(raw_target_size);
if (target_size <= 0) {
	accept_user_input = false;
	exit;
}

accept_user_input = true;
objButtonGenerator.target_size = round(target_size);

