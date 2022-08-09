/// @description Insert description here
// You can write your code in this editor

var target_name = "";
target_name = get_string("Choose target name of generated buttons. Use <num> to current represent image number.\nDefault is button<num>_off", objButtonGenerator.target_name);
if (target_name == "") {
	exit;
}
objButtonGenerator.target_name = target_name;