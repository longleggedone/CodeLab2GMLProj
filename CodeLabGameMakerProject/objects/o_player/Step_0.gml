if(place_free(x,y+1)) gravity = 1; //gravity system, if the space below us is free then apply gravity
else gravity = 0; //else do not

if (keyboard_check(vk_right)) hspeed = 5; //left/right movement
if (keyboard_check(vk_left)) hspeed = -5;

if(!keyboard_check(vk_right) && !keyboard_check(vk_left)) hspeed = 0; //don't move if nothing is pressed

if (keyboard_check_pressed(vk_space) && !place_free(x,y+1)) //if space is pressed and there is something solid beneath us
{
	vspeed = -20; //move up
}

//GRAPPLE LOGIC

if(mouse_check_button_pressed(mb_left)) //if left mouse is pressed
{
	gx = mouse_x; //set grapple coords to equal mouse position
	gy = mouse_y;
	if(place_meeting(gx,gy,o_blockG))  //if the grapple coords are meeting with a designated grapple block
	{
		grappling = true; //set grappling to be truex
	}
}

if(grappling) //if we're grappling
{
	gravity = 0.1 //lower gravity
	x += (gx - x) * 0.1; //tween to the grapple coords
	y += (gy - y) * 0.1;
}

if(mouse_check_button_released(mb_left)) //if left mouse is released
{
	grappling = false; //set grappling to be false
}

if(mouse_check_button(mb_left)) && (!grappleOut)
{
	//create instance of bullet on the bullet layer
	//at our position
	instance_create_layer(x, y, "Instances", o_grapple)
	//set cooldown to 10
	grappleOut = true;
}