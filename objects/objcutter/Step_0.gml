/// @description Insert description here
// You can write your code in this editor

if (selected) {
	x = max(0, mouse_x - selected_x);
	if (x + width >= room_width) {
		x = room_width - width;
	}
	y = max(0, mouse_y - selected_y);
	if (y + height >= room_height) {
		y = room_height - height;
	}
	exit;
}

var _kl, _kr, _ku, _kd;
_kl = keyboard_check(vk_left);
_kr = keyboard_check(vk_right);
_ku = keyboard_check(vk_up);
_kd = keyboard_check(vk_down);

if not (_kl or _kr or _ku or _kd) {
	held_direction = 0;
	exit;
}

if (held_direction == held_direction_max || held_direction == 0) {
	if (held_direction == 0) {
		held_direction++;
	}
	if (keyboard_check(vk_alt)) {
		if (_ku or _kr) {
			event_perform(ev_mouse, ev_mouse_wheel_up);
		} else if (_kd or _kl) {
			event_perform(ev_mouse, ev_mouse_wheel_down);
		}
	} else {
		if (_kl and x > 0) {
			x -= scroll_speed;
		} 
		if (_kr and x + width + scroll_speed < room_width) {
			x += scroll_speed;
		} 
		if (_ku and y > 0) {
			y -= scroll_speed;
		} 
		if (_kd and y + height + scroll_speed < room_height) {
			y += scroll_speed;
		}
	}
} else if (held_direction < held_direction_max) {
	held_direction++;
}
		