if (instance_exists(objDialogBox)) {
	exit;
} 

if (width > scroll_speed) {
	width -= scroll_speed;
	height -= scroll_speed;
} else {
	width = 1;
	height = 1;
}