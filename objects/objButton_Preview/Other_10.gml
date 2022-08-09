/// @description Insert description here
// You can write your code in this editor

if (objImageDisplay.current_directory == "") {
	exit;
}

objFrame.to_draw = target_button(objImageDisplay, objButtonGenerator.target_name, "_temp");
alarm[0] = 3;