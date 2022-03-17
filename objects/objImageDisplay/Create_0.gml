/// @description Insert description here
// You can write your code in this editor
fArray = ds_list_create();
current_directory = find_files(fArray);

mapEmotions = ds_map_create();
ini_file_path = find_char_ini(mapEmotions);

current_index = 1;
current_filename = ds_map_find_value(mapEmotions, current_index);
current_size = ds_map_size(mapEmotions);

event_user(0);

frame = instance_create_depth(0, 0, depth-1, objFrame);
frame.x = (sprite_width - frame.width)/2;

camera_set_view_pos(view_camera[0], (sprite_width - camera_get_view_width(view_camera[0])/2), 0);

if !directory_exists(current_directory + "\\emotions") {
	target_directory = current_directory + "\\emotions";
	directory_create(target_directory);
} else {
	target_directory = current_directory + "\\emotions2";
	if !directory_exists(current_directory + "\\emotions2") {
		directory_create(target_directory);
	}
}
