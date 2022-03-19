/// @description Insert description here
// You can write your code in this editor
with objPreview {
	event_user(1);
}
objPreview.character_name = target_button(objImageDisplay, "_off_temp");
with objPreview {
	event_user(0);
}
file_delete(objPreview.character_name);