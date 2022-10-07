/// @description Insert description here
// You can write your code in this editor
widget_set_owner(hwnd_main);
window_set_caption("DRO Button Maker");
instance_create_depth(x, y, depth, objImageDisplay);
instance_create_depth(x, y, depth, objButtonGenerator);
instance_create_depth(x, y, depth, objPreview);
instance_create_depth(x, y, depth, objFileConverter);

colors[0] = $000000;
colors[1] = $FF0000;
colors[2] = $00FF00;
colors[3] = $0000FF;
colors[4] = $FF00FF;
colors[5] = $FFFF00;
colors[6] = $00FFFF;
colors[7] = $FFFFFF;
color = 0;