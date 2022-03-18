var _max_width = camera_get_view_width(view_camera[0]);
var _max_height = camera_get_view_height(view_camera[0]);
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

if (width < _max_width && height < _max_height) {
	width += 1;
	height += 1;

	if (x + _x + width >= _max_width) {
		// Set to a fixed number given that mouse wheel up may be called several times per step
		x = max(0, x-1);
	}

	if (y + _y + height >= _max_height) {
		y = max(0, y-1);
	}
}