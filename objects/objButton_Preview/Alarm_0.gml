/// @description Insert description here
// You can write your code in this editor
with objPreview {
	event_user(1);
}
objPreview.filename = target_button(objImageDisplay, "_temp");
with objPreview {
	event_user(0);
}
file_delete(objPreview.filename);