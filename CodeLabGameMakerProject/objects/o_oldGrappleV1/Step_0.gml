move_bounce_solid(true);

if(mouse_check_button_pressed(mb_left))
{
	pd = point_direction(x,y,mouse_x, mouse_y); 
	dis = point_distance(x,y,mouse_x, mouse_y);
	grappleOut = true;
}
	


if(!grappleOut)
{
	x = o_player.x;
	y = o_player.y;
	vsp = 0;
	hsp = 0;
	grav = 0;
	dir = 0;
	grounded = 0;
}
else
{
	
	hsp = lengthdir_x(dis / 10, pd);
	vsp = lengthdir_y(dis / 10, pd);
}

grounded = (place_meeting(x,y + 1,o_block));

if (!grounded)
{
	vsp += grav;
} 
else 
{
	if (abs(0 - hsp) > 0.5) 
	{
		hsp -= hsp /10;	 
	}
	else
	{
		hsp = 0;
	}
}

////horizontal collisions
//if (place_meeting(x + hsp, y, o_block))
//{
//	while (!place_meeting(x + sign(hsp), y, o_block))
//	{
//		x += sign(hsp);
//	}
//	hsp = -hsp / 2;
//}

//horizontal movement
x += hsp;

////vertical collisions
//if (place_meeting(x, y + vsp, o_block))
//{
//	while (!place_meeting(x, y +sign(vsp), o_block))
//	{
//		y += sign(vsp);
//	}
//	vsp = -vsp / 1.5;
//}
////vertical movement
//if (grounded) && (abs(0 - vsp) < 1) vsp = 0;
y += vsp;



////-------------------------------------

//if(bounced = true)
//{
//	//if(speed > 0) speed -= 1
	
//	//if(place_free(x,y+1)) gravity = 1; //gravity system, if the space below us is free then apply gravity
//	//else gravity = 0; //else do not
	
//	if(!returning)
//	{
//		returning = true;
//	}
//}

//if(returning = true)
//{
//	x += (o_player.x - x) * 0.05; //tween to the grapple coords
//	y += (o_player.y - y) * 0.05;
//	if(distance_to_object(o_player) < 0.1)
//	{
//		o_player.grappleOut = false;
//		instance_destroy();
//	}
//}
////if(!o_player.grappling)
////{
////	x = o_player.x;
////	y = o_player.y;
////}

////if(o_player.grappling)
////{
////	x = o_player.gx;
////	y = o_player.gy;
////}

