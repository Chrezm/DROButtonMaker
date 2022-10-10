/// @description Place items in correct position
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

obj_dialogboxtext.text = text;
obj_dialogboxtext.x = x + _x_text_offset;
obj_dialogboxtext.y = y + _y_text_offset;

// Input box

// Buttons
var _button_size = 40;
var _x_button_offset = sprite_width/(_num_buttons+1) - _button_size/2;
_x_button_offset = clamp(_x_button_offset, base_offset, sprite_width);
var _y_button_offset = sprite_height/(_rows+1)*_rows - _button_size/2;
_y_button_offset = clamp(_y_button_offset, base_offset, sprite_height);

for (var i=0; i<_num_buttons; i++) {
	var _button = ds_list_find_value(buttons, i);
	_button.x = x + _x_button_offset*(i+1);
	_button.y = y + _y_button_offset;
}