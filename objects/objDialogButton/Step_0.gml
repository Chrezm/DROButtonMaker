/// @description

// Decide whether to show hover image or not

var _show_hover = (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom));

image_blend = _show_hover ? c_red : -1;