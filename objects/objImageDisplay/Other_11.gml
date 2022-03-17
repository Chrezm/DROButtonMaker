/// @description Display new image
var file, spr;

file = current_directory + "\\" + current_filename + ".png";
sprite_delete(sprite_index);
spr = sprite_add(file, 1, 0, 0, 0, 0);
sprite_index = spr;
room_width = sprite_width;
room_height = sprite_height;