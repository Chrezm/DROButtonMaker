/// @description

event_inherited();

text = "Inputbox. Accept, reject.";
keyboard_string = "";
has_input_box = true;

obj_button_accept = instance_create_depth(x, y, depth-1, objDialogButton_Accept);
obj_button_accept.dialog_box = self;
ds_list_add(buttons, obj_button_accept);

obj_button_reject = instance_create_depth(x, y, depth-1, objDialogButton_Reject);
obj_button_reject.dialog_box = self;
ds_list_add(buttons, obj_button_reject);