/// @description Clear temp

if (current_directory == "") {
	exit;
}

directory_destroy(current_directory + "\\bmtemp")
