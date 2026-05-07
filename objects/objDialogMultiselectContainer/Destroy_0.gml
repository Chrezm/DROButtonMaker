/// @description Insert description here
// You can write your code in this editor

while (array_length(obj_options) > 0) {
	var _obj_option = array_pop(obj_options);
	instance_destroy(_obj_option);
}