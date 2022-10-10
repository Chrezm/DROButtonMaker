/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objDialogBox)) {
	selected = false;
} else if (x <= mouse_x and mouse_x <= x+width and y <= mouse_y and mouse_y <= y+height) {
	selected = true;
	selected_x = mouse_x - x;
	selected_y = mouse_y - y;
} else {
	selected = false;
}