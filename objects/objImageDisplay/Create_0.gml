/// @description
emotions = ds_map_create();
current_emote = {
	name: "",
	parent_directory: "",
	outfit_directory: "",
	components: array_create(0),
	target_directory: "",
};
current_full_filenames = array_create(0);
current_visible_component_indices = array_create(0);
current_sprites = array_create(0);