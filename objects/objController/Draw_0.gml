draw_text(0, 0, "Path to ini: " + objImageDisplay.ini_file_path);
draw_text(0, 32, "Button directory: " + objImageDisplay.target_directory);

draw_text(0, 64+0, "Size of frame: " + string(objFrame.width));
draw_text(0, 64+32, "x coordinate of frame: " + string(objFrame.x));
draw_text(0, 64+64, "y coordinate of frame: " + string(objFrame.y));
draw_text(0, 64+96, "Current file: " + string(objImageDisplay.current_index) + " " + objImageDisplay.current_filename);