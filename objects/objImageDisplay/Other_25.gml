/// @description Cleanup
current_directory = "";
sprite_delete(sprite_index);
if (instance_exists(objCutter)) {
	instance_destroy(objCutter);
}