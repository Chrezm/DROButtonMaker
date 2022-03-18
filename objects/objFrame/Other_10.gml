var filename = target_button(objImageDisplay, "");
screen_save_part(filename, x-camera_get_view_x(view_camera[0]), y-camera_get_view_y(view_camera[0]), width, height);

objPreviewGenerator.filename = filename;
objPreviewGenerator.mode = 1;