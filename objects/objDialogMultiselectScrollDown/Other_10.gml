/// @description Insert description here
// You can write your code in this editor
if (!visible) {
	exit;
}
if (objDialogMultiselectContainer.page == objDialogMultiselectContainer.pages - 1) {
	exit;
}
objDialogMultiselectContainer.page++;
with objDialogMultiselectContainer {
	event_user(1);
}