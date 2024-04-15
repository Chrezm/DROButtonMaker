/// @description Cleanup
current_directory = "";
sprite_delete_if_valid(sprite_index);
if (instance_exists(objCutter)) {
	instance_destroy(objCutter);
}