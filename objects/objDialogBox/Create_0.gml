/// @description

x = cam_x(0) + (cam_w(0) - sprite_width)/2;
y = cam_y(0) + (cam_h(0) - sprite_height)/2;

buttons = ds_list_create();

obj_dialogboxtext = instance_create_depth(x, y, depth-1, objDialogBoxText);