// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function compute_available_layers(_emotions_map) {
	var _output = array_create(0);
	if (ds_map_empty(_emotions_map)) {
		return _output;
	}
	// We manually treat empty layer first
	array_push(_output, "");
	
	var _output_map_helper = ds_map_create();
	var _emotions_key = ds_map_find_first(_emotions_map);
	while (!is_undefined(_emotions_key)) {
		var _emote = ds_map_find_value(_emotions_map, _emotions_key);
		var _components = struct_get(_emote, "components");
		if (is_undefined(_components) || array_length(_components) == 0) {
			_emotions_key = ds_map_find_next(_emotions_map, _emotions_key);
			continue;
		}
		for (var _i = 0; _i < array_length(_components); _i++) {
			var _component = _components[_i];
			var _layer_name = struct_get(_component, "layer_name");
			if (is_undefined(_layer_name) || _layer_name == "") {
				continue;
			}
			ds_map_add(_output_map_helper, _layer_name, true);
		}
		_emotions_key = ds_map_find_next(_emotions_map, _emotions_key);
	}
	
	var _layer = ds_map_find_first(_output_map_helper);
	while (!is_undefined(_layer)) {
		array_push(_output, _layer);
		_layer = ds_map_find_next(_output_map_helper, _layer);
	}	
	ds_map_destroy(_output_map_helper);
	return _output;
}

function get_visible_full_filenames() {
	// There's gotta be a better way of doing this
	var _output = [];
	with objImageDisplay {
		for (var _i = 0; _i < array_length(current_emote.components); _i++) {
			var _layer = struct_get(current_emote.components[_i], "layer_name");
			if (is_undefined(_layer)) {
				throw("Unexpected component " + string(current_emote.components[_i]) + 
				  + " without a layer name.")
			}
			var _is_component_visible = false;
			for (var _j = 0; _j < array_length(current_visible_component_indices); _j++) {
				var _layer_index = current_visible_component_indices[_j];
				if (current_available_layers[_layer_index] == _layer) {
					_is_component_visible = true;
					break;
				}
			}
			
			array_push(_output, _is_component_visible ? current_full_filenames[_i] : undefined);
		}
	}
	return _output;
}

