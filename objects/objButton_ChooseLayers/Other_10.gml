/// @description Insert description here
// You can write your code in this editor

var _options = array_clone(objImageDisplay.current_available_layers);
var _options_selected = array_map((objImageDisplay.current_visible_component_indices), function(_index) {
	// Offset by 1
	return _index-1;	
});
// Drop first element (empty)
if (array_length(_options) == 0) {
	exit;
}
array_shift(_options);
array_shift(_options_selected);
show_multiselectbox_async(
	objMultiSelectBox_ChooseLayers,
	"Choose layers",
	_options,
	_options_selected
);