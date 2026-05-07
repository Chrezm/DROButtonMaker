/// @description Insert description here
// You can write your code in this editor

sprite_index = selected ? sprButton_Accept : sprButton_Empty;
event_inherited();
var _x_offset = sprite_width * 1.2;
var _y_offset = sprite_height/2 - string_height(label)/2;
draw_text(x + _x_offset, y + _y_offset, label);