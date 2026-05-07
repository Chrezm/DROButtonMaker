/// @description Rerender options
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
for (var _i = 0; _i < array_length(multiselect_options); _i++) {
	var _option = multiselect_options[_i];
	var _x = x + _x_offset;
	var _y = y + _y_offset + _i * _y_gap;
	var _obj_option = instance_create_depth(_x, _y, depth-1, objDialogMultiselectOption);
	_obj_option.label = _option;
	if (array_contains(multiselect_options_selected, _i)) {
		_obj_option.selected = true;	
	}
	array_push(obj_options, _obj_option);
}