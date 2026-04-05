/// @description Insert description here
// You can write your code in this editor

show_inputbox_async(
	objInputBox_ChooseTargetName,
	"Choose target name of generated buttons.\n" + 
	"<num> represents current image number.\n" + 
	"<name> represent current emote name.\n" + 
	"Default is " + objButtonGenerator.default_target_name,
	objButtonGenerator.target_name
);
