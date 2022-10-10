/// @description

with (obj_dialogtext) {
	instance_destroy();
}
with (obj_dialoginput) {
	instance_destroy();
}

for (var i = 0; i < ds_list_size(buttons); i++) {
	var obj = ds_list_find_value(buttons, i);
	with (obj) {
		instance_destroy();
	}
}
ds_list_destroy(buttons);