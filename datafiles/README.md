# DROButtonMaker
Button Maker for Danganronpa Online, created with GameMaker. The source code is available at https://github.com/Chrezm/DROButtonMaker

**Only PNG, GIF, APNG, and WEBP images are currently supported. If some other format miraculously works, it is currently not guaranteed it will continue to work afterwards.**

This project is licensed under a modified MIT license. This license is identical to the standard MIT license, with the exception that you are also required to follow all EULAs for all third-party extensions the project currently uses before you redistribute derivative work. The current third-party extensions in use are:
* "Better Scaling" by Mytino at https://marketplace.yoyogames.com/assets/1911/better-scaling 
* "ImageMagick" by ImageMagick Studio LLC at https://imagemagick.org

## Instructions

### Most common workflow

1. Click "Choose character".
2. On the first dialog screen, select the character registry file of your character (typically a `char.ini` or `char.json`).
3. The first sprite in the character registry that would logically be rendered first in Danganronpa Online will be searched in the character folder, with the following lookup considerations:
  - The following file prefixes will be considered in this priority order: `/(a)`, `/(a)/`, `/`.
  - The following file suffixes will be considered in this priority order: `.webp`, `.apng`, `.gif`, `.png`.
  - The first prefix, suffix pair such that a file in the character folder with such prefix and suffix added exists will be the one the application will use. All suffixes will be considered first before starting to consider the next prefix.
4. The sprite will start loading. If such process takes a while, a loading icon will appear on screen until it is ready.
5. You'll then see the sprite loaded, along with a white "cutter" box. 
6. Click on the related buttons to the right of the screen to change several options of your eventually rendered button. Each of these options keeps their latest value until the next time they are changed.
  - The default background behind a generated button (by default nothing).
  - The default foreground in front of a generated button (by default nothing).
  - A "Selected" image to draw over the character sprite *and* foreground to produce on buttons (by default nothing).
  - A "mask" image that will determine the shape and fading of the overall produced buttons (by default a fully opaque square mask).
  - The intended name and size of the produced buttons (for name, by default it is `button<num>_off.png` for `char.ini` registry files and `<name>` for `char.json` registry files; for size, by default it is 40).
7. If a sprite with several frames was loaded, two additional buttons will appear that will let you cycle between the different frames of the sprite.
8. Adjust the size and position of the cutter until it aligns with your intended button for the current image. 
9. Once ready, click "Generate Button" or push Space. It'll generate a button in a folder called `emotions` (or `emotions2` if the previous folder already existed), containing the image found *exactly within* the white cutter box. The location of that containing folder will be the directory of the character (for `char.ini` registry files), or the directory of the outfit associated with the emote (for `char.json` registry files)
10. The next image in the character registry file that ouwld logically be rendered in Danganronpa Online will be searched in the character folder, and the process will continue as described above. Proceed until done.
11. If at any point you want to change the current image without generating a button, click "Previous Image" or "Skip Image".

### Controls

* You control the cutter by Left Clicking in an area within the box, and dragging the cutter while hoding the Mouse Button. You can also control the cutter with the Up, Down, Left, Right arrow keys (for more precise controls), and make it move faster by holding Shift while pressing the arrow keys.  
* You increase the size of the cutter by scrolling the mouse wheel up, and decrease it by scrolling it down. You can also do adjust the size with Alt+Up or Alt+Right to increase the size, and Alt+Left or Alt+Down to decrease the size. In either case, you can adjust the size faster if you hold Shift while doing either method.
* You display guidelines on top of the cutter by holding Control. The guidelines will draw a vertical and horizontal line both passing through the center of the cutter. The width of the line is 1 if the size of the cutter is odd and size if the size of the cutter is even. The guidelines are not added to the generated button if they happen to be active when an order to generate a button is completed.
* You display a zoomed version of the image, cutter, and guidelines if visible, near the cursor by holding Right Click. If you hold Right Click and move the cursor, the zoomed version will change reflecting the new cursor position. This is useful if you want to get super precise with your cutter location.
* If a dialog box appears, you activate the dialog box buttons by clicking on them, or pushing Enter to trigger the "Accept" check button (if it exists), or pushing Escape to trigger the "Escape" cross button (if it exists).
* If a dialog box appears with an input box, the contents of the input box can be modified with the keyboard keys.
* If a dialog box appears, and after attempting to click a button the dialog box flashes red, that means that the button (or the text in the input box) was not accepted. Try again with a different button (or different text if applicable).

### Buttons
* "Previous Image": Go back one image without generating a button file. If the currently displayed image was the first one in the character registry file, the last image in the character registry file will be displayed.
* "Skip Image": Go forward one image without generating a button file. If the currently displayed image was the last one in the character registry file, the firstimage in the character registry file will be displayed.
* "Clear Temp": Delete the temporary folder created in the character folder to handle animated images (if it exists).
* "Preview": Get a preview of how the final button with the intended target size will look like once generated.
* "Generate Button": Generate a button with the current settings and advance to the next image.
* "Choose Character": Choose the character registry file of your target character. If you select None, your current selection will be cleared.
* "Choose Background": Choose the background to add to your buttons. If you select None, your current selection will be cleared.
* "Choose Foreground": Choose the foreground to add to your buttons. If you select None, your current selection will be cleared.
* "Choose 'Selected.png'": Choose the "Selected" image to add to your buttons to generate "on" buttons. If you select None, your current selection will be cleared.
* "Choose Mask": Choose the mask to use when generating buttons. Masks should be images containing only black pixels with some amount of transparency. The location of said pixels affect how visible (if at all) each pixel will be in your produced image. If you select None, your current selection will be cleared.
* "Choose Target Size": Choose the target size of your buttons. This must be an integer greater than 0. 
* "Choose Target Name": Choose the target name of your buttons. Any instances of "<num>" will be replaced by the current emote number. If the target name ends with "_off", the generated on buttons will have the same name but replacing the trailing "_off" with "_on"; otherwise, an "_on" will be added to the file name. Note that all generated buttons will have a `.png` suffix added, so the target name should not have a file extension included.

If an animated image (an image with more than one frame) was loaded, two additional buttons will appear.
* "Left Arrow": Go back one frame of the animated image. If the currently displayed frame was the first one, the last frame will be displayed.
* "Right Arrow": Go forward one frame of the animated image. If the currently displayed frame was the last one, the first frame will be displayed.
