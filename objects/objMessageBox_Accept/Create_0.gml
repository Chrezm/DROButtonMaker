/// @description

event_inherited();

text = "Message box. Accept.";
has_input_box = false;

obj_button_accept = instance_create_depth(x, y, depth-1, objDialogButton_Accept);
obj_button_accept.dialog_box = self;
ds_list_add(buttons, obj_button_accept);