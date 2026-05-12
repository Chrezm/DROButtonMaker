/// @description Re-create options
// Delete old options
while (array_length(obj_options) > 0) {
	var _obj_option = array_pop(obj_options);
	instance_destroy(_obj_option);
}

if (!visible) {
	exit;
}

// And generate the new ones
var _x_offset = sprite_get_width(sprButton_Accept) * 0.2;
var _y_offset = sprite_get_height(sprButton_Accept) * 0.2;
var _y_gap = sprite_get_height(sprButton_Accept) * 1.2;

pages = ceil(array_length(multiselect_options) / 3);
if (page >= pages) {
	page = 0;
}
// We do a fancy trick here of spawning every option where they should logically be
// but only (eventually) marking those options meant to be visible as... visible.
for (var _i = 0; _i < array_length(multiselect_options); _i++) {
	var _option = multiselect_options[_i];
	var _x = x + _x_offset;
	var _y = y + _y_offset + (_i mod options_per_page) * _y_gap;
	var _obj_option = instance_create_depth(_x, _y, depth-1, objDialogMultiselectOption);
	_obj_option.label = _option;
	if (array_contains(multiselect_options_selected, _i)) {
		_obj_option.selected = true;	
	}
	
	array_push(obj_options, _obj_option);
}

var _x_right_offset = sprite_width - (sprite_get_width(sprButton_ArrowUp) * 1.2);
obj_scrollup.x = x + _x_right_offset;
obj_scrollup.y = y + _y_offset;
obj_scrolldown.x = x + _x_right_offset;
obj_scrolldown.y = y + _y_offset + (options_per_page-1) * _y_gap;


event_user(1);