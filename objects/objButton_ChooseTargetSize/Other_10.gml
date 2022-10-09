/// @description Insert description here
// You can write your code in this editor

var target_size = 0;
while (target_size < 1) {
	show_message("e")
	raw_target_size = get_string("Choose target size of generated buttons.\nDefault is 40.", 
							 string(objButtonGenerator.target_size));
	if (is_undefined(target_size)) {
		exit;
	}
	target_size = real(raw_target_size)
}
objButtonGenerator.target_size = round(target_size);