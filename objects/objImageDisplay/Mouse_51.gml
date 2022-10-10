/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objDialogBox)) {
	draw_zoom = false;
	exit;
}
if (sprite_exists(sprite_index)) {
	draw_zoom = true;
	exit;
}
draw_zoom = false;
