/// @description
emotions = ds_map_create();
lookup_prefixes = ["\\(a)", "\\(a)\\", "\\"];
lookup_suffixes = [".webp", ".apng", ".gif", ".png"];
current_emote = {
	name: "",
	stem: "",
	parent_directory: "",
	path_minus_extension: ""
};