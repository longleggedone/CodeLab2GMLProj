move_bounce_solid(true);

//show_message(string(speed))
show_debug_message("bounced" + string(bounced))



if(bounced = true)
{
	if(speed != 0)
	{
		speed -= min(abs(speed), 0.01) * sign(speed);
	}
	
	if(place_free(x,y+1)) gravity = 1; //gravity system, if the space below us is free then apply gravity
	else gravity = 0; //else do not
	
	if(!returning)
	{
		returning = true;
	}
}

if(returning = true)
{
	x += (o_player.x - x) * 0.05; //tween to the grapple coords
	y += (o_player.y - y) * 0.05;
	if(distance_to_object(o_player) < 0.1)
	{
		o_player.grappleOut = false;
		instance_destroy();
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
