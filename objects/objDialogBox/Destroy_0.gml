/// @description

with (obj_dialogtext) {
	instance_destroy();
}
with (obj_dialoginput) {
	instance_destroy();
}

for (var _i = 0; _i < ds_list_size(buttons); _i++) {
	var _obj = ds_list_find_value(buttons, _i);
	with (_obj) {
		instance_destroy();
	}
}
ds_list_destroy(buttons);