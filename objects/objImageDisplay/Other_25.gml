/// @description Cleanup
current_directory = "";
sprite_delete(sprite_index);
if (instance_exists(objFrame)) {
	instance_destroy(objFrame);
}