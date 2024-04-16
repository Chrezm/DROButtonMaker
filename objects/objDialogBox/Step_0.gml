/// @description Place items in correct position
var _keyboard_string = keyboard_string;
var _keyboard_string_limit = 30;
if (string_length(_keyboard_string) > _keyboard_string_limit) {
	_keyboard_string = string_copy(_keyboard_string, 1, _keyboard_string_limit);
}
keyboard_string = _keyboard_string;
user_text = _keyboard_string;

var _rows;
var _num_buttons = ds_list_size(buttons);

if (_num_buttons > 0 && has_input_box) {
	_rows = 3;
} else if (_num_buttons > 0 || has_input_box) { 
	_rows = 2;
} else {
	_rows = 1;
}

// Text
var _x_text_offset = sprite_width/2 - string_width(text)/2;
_x_text_offset = clamp(_x_text_offset, base_offset, sprite_width);
var _y_text_offset = sprite_height/(_rows+1)*1 - string_height(text)/2;
_y_text_offset = clamp(_y_text_offset, base_offset, sprite_height);

obj_dialogtext.text = text;
obj_dialogtext.x = x + _x_text_offset;
obj_dialogtext.y = y + _y_text_offset;

// Input box
obj_dialoginput.visible = has_input_box;

if (has_input_box) {
	var _x_inputbox_offset = sprite_width/2 - obj_dialoginput.sprite_width/2;
	_x_inputbox_offset = clamp(_x_inputbox_offset, base_offset, sprite_width);
	var _y_inputbox_offset = sprite_height/(_rows+1)*2 - obj_dialoginput.sprite_height/2;
	_y_inputbox_offset = clamp(_y_inputbox_offset, base_offset, sprite_height);

	obj_dialoginput.user_text = user_text;
	obj_dialoginput.x = x + _x_inputbox_offset;
	obj_dialoginput.y = y + _y_inputbox_offset;
}

// Buttons
if (_num_buttons > 0) {
	var _button_size = 40;
	var _x_button_offset = sprite_width/(_num_buttons+1) - _button_size/2;
	_x_button_offset = clamp(_x_button_offset, base_offset, sprite_width);
	var _y_button_offset = sprite_height/(_rows+1)*_rows - _button_size/2;
	_y_button_offset = clamp(_y_button_offset, base_offset, sprite_height);

	for (var _i = 0; _i<_num_buttons; _i++) {
		var _button = ds_list_find_value(buttons, _i);
		_button.x = x + _x_button_offset*(_i+1);
		_button.y = y + _y_button_offset;
	}
}