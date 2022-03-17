_x = camera_get_view_x(view_camera[0]);
_y = camera_get_view_y(view_camera[0]);

draw_text(_x, _y +0, "Path to ini: " + objImageDisplay.ini_file_path);
draw_text(_x, _y +32, "Button directory: " + objImageDisplay.target_directory);

draw_text(_x, _y +64+0, "Size of frame: " + string(objFrame.width));
draw_text(_x, _y +64+32, "x coordinate of frame: " + string(objFrame.x));
draw_text(_x, _y +64+64, "y coordinate of frame: " + string(objFrame.y));
draw_text(_x, _y +64+96, "Current file: " + string(objImageDisplay.current_index) + " " + objImageDisplay.current_filename);