/// @description Clicked Accept
var _raw_target_size = string_digits(user_text);
if (user_text == "" || _raw_target_size != string(user_text)) {
	accept_user_input = false;
	exit;
}

var _target_size = 0;
_target_size = real(_raw_target_size);
if (_target_size <= 0) {
	accept_user_input = false;
	exit;
}

accept_user_input = true;
objButtonGenerator.target_size = round(_target_size);

