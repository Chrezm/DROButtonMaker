# DROButtonMaker
Button Maker for Danganronpa Online, created with GameMaker Studio 2. The source code is available at https://github.com/Chrezm/DROButtonMaker

**Only PNG images can currently be loaded to generate buttons. Sorry.**

This project is licensed under a modified MIT license. This license is identical to the standard MIT license, with the exception that you are also required to follow all EULAs for all third-party extensions the project currently uses before you redistribute derivative work. The current third-party extensions in use are:
* "Better Scaling" by Mytino at https://marketplace.yoyogames.com/assets/1911/better-scaling 
* "ImageMagick" by ImageMagick Studio LLC at https://imagemagick.org/script/index.php
* "xProcess" by Samuel Venable at https://samuel-venable.itch.io/gamemaker-extension-collection

## Instructions

### Most common workflow

1. Click "Choose character".
2. On the first dialog screen, select the char.ini of your character.
3. You'll see the first sprite listed in the char.ini appear, along with a white frame. 
4. Click on the related buttons to the right of the screen to change the default background behind a generated button (by default nothing), the default foreground in front of a generated button (by default nothing), a "Selected" image to draw over the character sprite *and* foreground to produce on buttons (by default nothing), a "mask" image that will determine the shape and fading of the overall produced buttons (by default a fully opaque square mask), and the intended name and size of the produced buttons (by default button<num>_off.png and 40).
4. Adjust the size position frame until it aligns with your intended button for the current image. Once ready, click "Generate Button" or push Space. It'll generate a button in the folder emotions (or emotions2 if the previous folder already existed), containing the image found *exactly within* the white box.
5. The next image in the char.ini will appear. Proceed until done.
6. If at any point you want to change the current image without generating a button, click "Previous Image" or "Skip Image".

### Controls

* You control the frame by Left Clicking in an area within the box, and dragging the frame while hoding the Mouse Button. You can also control the frame with the up, down, left, right arrow keys (for more precise controls), and make it move faster by holding Shift while pressing the arrow keys.  
* You increase the size of the frame by scrolling the mouse wheel up, and decrease it by scrolling it down. You can also do adjust the size with Alt+Up or Alt+Right to increase the size, and Alt+Left or Alt+Down to decrease the size. In either case, you can adjust the size faster if you hold Shift while doing either method.
* You display guidelines on top of the frame by holding Control. The guidelines will draw a vertical and horizontal line both passing through the center of the frame. The width of the line is 1 if the size of the frame is odd and size if the size of the frame is even.
* You display a zoomed version of the image, frame, and guidelines if visible, near the cursor by holding Right Click. If you hold Right Click and move the cursor, the zoomed version will change reflecting the new cursor position. This is useful if you want to get super precise with your frame location.

### Buttons
* "Previous Image": Go back one image without generating a button file.
* "Skip Image": Go forward one image without generating a button file.
* "Preview": Get a preview of how the final button with the intended target size will look like once generated.
* "Generate Button": Generate a button with the current settings and advance to the next image.
* "Choose Character": Choose the char.ini of your target character. If you select None, your current selection will be cleared.
* "Choose Background: Choose the background to add to your buttons. If you select None, your current selection will be cleared.
* "Choose Foreground: Choose the foreground to add to your buttons. If you select None, your current selection will be cleared.
* "Choose 'Selected.png'": Choose the "Selected" image to add to your buttons to generate "on" buttons. If you select None, your current selection will be cleared.
* "Choose Mask": Choose the mask to use when generating buttons. Masks should be images containing only black pixels with some amount of transparency. The location of said pixels affect how visible (if at all) each pixel will be in your produced image. If you select None, your current selection will be cleared.
* "Choose Target Size": Choose the target size of your buttons. This must be a number greater than 1. Your input number will be rounded to the nearest integer if necessary.
* "Choose Target Name: Choose the target name of your buttons. This must be a non-empty string. Any instances of "<num>" will be replaced by the current emote number. Buttons with "Selected" images will be generated when provided a Selected image only if the target name includes "_off" (which will be automatically replaced with "_on" when generated).