/// @description Cleanup
current_directory = "";
ini_file_path = "";
sprite_delete(sprite_index);
if (instance_exists(objFrame)) {
	instance_destroy(objFrame);
}