/// @description

var _x = cam_x(0);
var _y = cam_y(0);

x = xstart + _x;
y = ystart + _y;

// Decide whether to show hover image or not

var _show_hover = false;

if (instance_exists(objDialogBox)) {
	_show_hover = false;
} else {
	_show_hover = (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom));
}

image_blend = _show_hover ? c_red : -1;