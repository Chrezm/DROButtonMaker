/// @description

image_speed = 0;

x = cam_x(0) + (cam_w(0) - sprite_width)/2;
y = cam_y(0) + (cam_h(0) - sprite_height)/2;

buttons = ds_list_create();

obj_dialogtext = instance_create_depth(x, y, depth-1, objDialogText);
obj_dialoginput = instance_create_depth(x, y, depth-1, objDialogInput);
keyboard_string = "";