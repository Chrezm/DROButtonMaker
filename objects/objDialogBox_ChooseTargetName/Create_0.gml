/// @description

event_inherited();

text = "Choose target name of generated buttons.\n<num> represents current image number.\nDefault is button<num>_off";
keyboard_string = objButtonGenerator.target_name;
has_input_box = true;

btn1 = instance_create_depth(x, y, depth-1, objDialogButton_Accept);
btn1.dialog_box = self;
ds_list_add(buttons, btn1);

btn2 = instance_create_depth(x, y, depth-1, objDialogButton_Reject);
btn2.dialog_box = self;
ds_list_add(buttons, btn2);