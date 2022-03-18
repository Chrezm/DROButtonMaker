/// @description Insert description here
// You can write your code in this editor
	
screen_save_part(string_replace(filename, "_off", "_small_off.png"), 0, 0, 40, 40);
sprite_delete(sprite_index);
mode = 0;
filename = "";