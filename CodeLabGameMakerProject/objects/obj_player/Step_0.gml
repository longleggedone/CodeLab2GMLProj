//arrow key movement, math can be  on same line as if statement and still work
if (keyboard_check(vk_right)) x = x + 4;
if (keyboard_check(vk_left)) x = x - 4;
if (keyboard_check(vk_up)) y = y - 4;
if (keyboard_check(vk_down)) y = y + 4;

//rotate sprite to point at mouse
image_angle = point_direction(x,y, mouse_x, mouse_y);

//if we're pressing the left mouse button and our cooldown is less than 1
if(mouse_check_button(mb_left)) && (cooldown < 1)
{
	//create instance of bullet on the bullet layer
	//at our position
	instance_create_layer(x, y, "Bullets", obj_bullet)
	//set cooldown to 10
	cooldown = 10;
}
//subtract 1 from cooldown every frame
cooldown = cooldown - 1;