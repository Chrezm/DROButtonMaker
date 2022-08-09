/// @description Insert description here
// You can write your code in this editor

if (source_filename == "") {
	exit;	
}

var target_filename = pngify(source_filename);
process = split_frames(source_filename, target_filename);
alarm[0] = 10;
