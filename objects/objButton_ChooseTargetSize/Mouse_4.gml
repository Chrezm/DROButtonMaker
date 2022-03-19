/// @description Insert description here
// You can write your code in this editor

var target_size = 0;
while (target_size < 1) {
	target_size = get_integer("Choose target size of generated buttons", 40);
}
objButtonGenerator.target_size = round(target_size);