//for jumping
jump = keyboard_check_pressed(vk_space);
jumpRelease = keyboard_check_released(vk_space);
//for left right movement
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
//for moving along rope
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
//for grappling
lMouseClick = mouse_check_button_pressed(mb_left);
lMouseRelease = mouse_check_button_released(mb_left);
