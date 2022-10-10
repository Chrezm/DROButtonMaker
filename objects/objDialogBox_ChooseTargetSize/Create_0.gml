/// @description

event_inherited();

text = "Choose target size of generated buttons.\nDefault is 40";
keyboard_string = objButtonGenerator.target_size;
has_input_box = true;

btn1 = instance_create_depth(x, y, depth-1, objDialogButton_Accept);
btn1.dialog_box = self;
ds_list_add(buttons, btn1);

btn2 = instance_create_depth(x, y, depth-1, objDialogButton_Reject);
btn2.dialog_box = self;
ds_list_add(buttons, btn2);