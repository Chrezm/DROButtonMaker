if (instance_exists(objDialogBox)) {
	exit;
} 

var _max_width = cam_w(0);
var _max_height = cam_h(0);

if (width < _max_width && height < _max_height) {
	width = min(_max_width, width + scroll_speed);
	height = min(_max_height, height + scroll_speed);

	if (x + width > room_width) {
		// Set to a fixed number given that mouse wheel up may be called several times per step
		x = max(0, room_width - width);
	}

	if (y + height > room_height) {
		y = max(0, room_height - height);
	}
}