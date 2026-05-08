/// @description Reset option visibility
for (var _i = 0; _i < array_length(obj_options); _i++) {
	obj_options[_i].visible = (_i div options_per_page) == page;
}