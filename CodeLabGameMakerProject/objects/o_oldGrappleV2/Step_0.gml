move_bounce_solid(true); //enables bouncing off of solid objects

//show_message(string(speed))
show_debug_message("bounced" + string(bounced))



if(bounced = true) //if we've bounced off of something
{
	if(speed != 0) //if our speed isn't 0 yet
	{
		speed -= min(abs(speed), 0.01) * sign(speed); //move speed towards 0
	}
	
	if(place_free(x,y+1)) gravity = 1; //gravity system, if the space below us is free then apply gravity
	else gravity = 0; //else do not
	
	if(speed < 2 && !returning) //if we aren't returning yet, and our speed is low
	{
		returning = true; //set to be returning
	}
}

if(returning = true) //if we are returning
{
	x += (o_player.x - x) * 0.05; //tween our position to the player's position
	y += (o_player.y - y) * 0.05;
	if(distance_to_object(o_player) < 0.1) //if our distance to the player is very small
	{
		o_player.grappleOut = false; //tell the player they no longer have their grapple out
		instance_destroy(); //destroy this grapple
	}
}
//if(!o_player.grappling)
//{
//	x = o_player.x;
//	y = o_player.y;
//}

//if(o_player.grappling)
//{
//	x = o_player.gx;
//	y = o_player.gy;
//}
