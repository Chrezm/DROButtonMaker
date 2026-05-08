/// @description Display new image
// You can write your code in this editor

while (array_length(current_sprites) > 0) {
	var _current_sprite = array_pop(current_sprites);
	sprite_delete_if_valid(_current_sprite);
}
preparing_frames = false;

if (array_length(current_full_filenames) == 0) {
	// This shouldn't happen
	throw ("Empty current full filenames detected when trying to display image");	
}
for (var _i = 0; _i < array_length(current_emote.components); _i++) {
	var _layer = struct_get(current_emote.components[_i], "layer_name");
	if (is_undefined(_layer)) {
		throw("Unexpected component " + string(current_emote.components[_i]) + 
		  + " without a layer name.")
	}
	var _is_component_visible = false;
	// There's gotta be a better way of doing this
	for (var _j = 0; _j < array_length(current_visible_component_indices); _j++) {
		var _layer_index = current_visible_component_indices[_j];
		if (current_available_layers[_layer_index] == _layer) {
			_is_component_visible = true;
			break;
		}
	}
	
	if (!_is_component_visible) {
		array_push(current_sprites, -1);
		continue;
	}
	var _spr = sprite_add(current_full_filenames[_i], 1, 0, 0, 0, 0);
	array_push(current_sprites, _spr);
}
sprite_index = -1;
room_width = cam_w(0);
room_height = cam_h(0);