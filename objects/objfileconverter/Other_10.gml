/// @description Start spliting frames
// You can write your code in this editor

if (source_filename == "") {
	exit;	
}

target_filename = pngify(source_filename);
process = split_frames(source_filename, target_filename);
alarm[0] = 10;
