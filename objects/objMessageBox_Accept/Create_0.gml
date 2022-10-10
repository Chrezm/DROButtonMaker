/// @description

event_inherited();

text = "Dialog box. Accept.";
has_input_box = false;

btn1 = instance_create_depth(x, y, depth-1, objDialogButton_Accept);
btn1.dialog_box = self;
ds_list_add(buttons, btn1);