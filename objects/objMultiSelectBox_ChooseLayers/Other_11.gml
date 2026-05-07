/// @description Insert description here
// You can write your code in this editor
event_inherited();
var _options = obj_dialogmultiselect_container.obj_options;
objImageDisplay.current_visible_component_indices = array_create(0);
array_push(objImageDisplay.current_visible_component_indices, 0); // First element visible
for (var _i = 0; _i < array_length(_options); _i++) {
	if (_options[_i].selected) {
		// Offset by 1, as options do not include 0th (default) layer
		array_push(objImageDisplay.current_visible_component_indices, _i+1);	
	}
}
with objImageDisplay {
	event_user(2);
}