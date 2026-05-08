/// @description Insert description here
// You can write your code in this editor
if (!visible) {
	exit;
}
if (objDialogMultiselectContainer.page == 0) {
	exit;
}
objDialogMultiselectContainer.page--;
with objDialogMultiselectContainer {
	event_user(1);
}