//states 
switch (state) 
{ //based on which state we are in, do something

    //walk state
    case WALKING: //if walking                      
        hsp = (right - left) * walkSpeed; //set horizontal speed according to right/left movement multiplied by walk speed
        vsp += grav; //add gravity to vertical speed                                
   
        if (jump) 
		{  //if we jump                               
            state = JUMPING; //change state to jump   
			show_debug_message("Jumping")
            vsp = jumpSpeed;
		}   // set vertical speed to jump speed               

        if (!place_meeting(x, y + 1, obj_solid)) 
		{ //if we are not standing on a wall, switch states to jump
            state = JUMPING;
			show_debug_message("Jumping")
		}
   
        break;

    //jump state
    case JUMPING: //if jumping            
        hsp = (right - left) * walkSpeed; //horizontal speed is the same as when walking  
        vsp += grav; //gravity is the same as when walking                               
   
        if (place_meeting(x, y + 1, obj_solid)) 
		{ //if we are standing on a wall
            state = WALKING;
				show_debug_message("Walking")
		} //switch states to walking                         
   
        //if (lMouseClick) 
		//{ //if we click while jumping
        //    angle = point_direction(x, y, mouse_x, mouse_y); //set angle to the direction between us and the mouse
        //    var dist = point_distance(x, y, mouse_x, mouse_y); //create a temp var and set dist to equal the distance between us and the mouse
        //    dist = min(dist, maxDistance); //set dist to equal either itself or our max distance, whichever is lower
        //    var loop_count = 0; //create a var to hold our loop count, start it at 0
        //    anchorX = x; //set anchor coords to begin at ours
        //    anchorY = y;
       
        //    while (!collision_point(anchorX, anchorY, obj_solid, false, true)) && (loop_count < dist) 
		//	{ //while the anchor is not colliding with a wall and while the loop count is less than dist
        //        anchorX += lengthdir_x(1, angle); //move anchor coords by length of 1 along our angle
        //        anchorY += lengthdir_y(1, angle);
        //        loop_count += 1;
		//	} //add to loop count

        //    if (collision_point(anchorX, anchorY, obj_solid, false, true)) 
		//	{  //if the anchor collides with a wall         
        //        angle = point_direction(anchorX, anchorY, x, y); //angle now equals the direction between the anchor and our position
        //        distance = point_distance(anchorX, anchorY, x, y); //distance now equals the distance between the anchor and our position
        //        state = SWINGING; //switch state to swinging
        //        vsp = 0; //set vertical and horizontal speed to 0
        //        hsp = 0;
        //        angleVelocity = 0;
		//	}
		//} //set our angle velocity to 0

           
        break;
 
    //swing state 
	
    case SWINGING: //when swinging 

        distance += (down - up); //change distance using up/down inputs
        angleAcceleration = -.1 * dcos(angle); //set angle acceleration using our the cosine in degrees of our angle
        var add_acceleration = (right - left) * .01; //create var to hold our added acceleration using inputs
        angleAcceleration += add_acceleration; //add our input acceleration to update our current acceleration
        angleVelocity += angleAcceleration; //increase our angular velocity by our angle acceleration
        angle += angleVelocity; //increase angle by angle velocity  
 
        var new_x = anchorX + lengthdir_x(distance, angle); //create variables to hold our new position based on the angle and distance to the anchor
        var new_y = anchorY + lengthdir_y(distance, angle);
 
        hsp = new_x - x; //horizontal and vertical speed update using new x and y
        vsp = new_y - y;
		
			
   
        if (place_meeting(x + 1, y, obj_solid)) || //if we collide with a wall
           (place_meeting(x - 1, y, obj_solid)) ||
           (place_meeting(x, y + 1, obj_solid)) ||
           (place_meeting(x, y - 1, obj_solid)) 
		   {
            state = JUMPING;
			show_debug_message("Jumping")
			retracting = true;
			} //switch state to jump
       
        if (lMouseClick) 
		{ //if we click
            state = JUMPING;
			retracting = true;
			show_debug_message("Jumping")
		} //switch state to jump
       
        if (jump) 
		{ //if we press space 
            vsp = jumpSpeed;//set vertical speed to jump speed
            state = JUMPING;
			retracting = true;
			show_debug_message("Jumping")
		} //switch state to jump
       
        break;
}

//for throwing/retracting hook

if (lMouseClick && !grappleOut){//if the hook is not already out and we click the mouse
	throwing = true; //set throwing to true
		show_debug_message("Threw hook")
	grappleOut = true; //set grappleOut to true
	instance_create_depth(x,y, -10, o_grappleHook); //create a hook at the player position
    angle = point_direction(x, y, mouse_x, mouse_y); //set angle to the direction between us and the mouse
    dist = point_distance(x, y, mouse_x, mouse_y); //create a temp var and set dist to equal the distance between us and the mouse
    dist = min(dist, maxDistance); //set dist to equal either itself or our max distance, whichever is lower
    loop_count = 0; //create a var to hold our loop count, start it at 0
    anchorX = x; //set anchor coords to begin at ours
    anchorY = y;
}


if(grappleOut == true)
{
	if(lMouseRelease)//if we are throwing and release the mouse button
	{
		throwing = false; //stop throwing
		retracting = true; //start retracting
		loop_count = 0; //reset loop count for retracting
		if(state == SWINGING)
		{
			state = JUMPING;
		}
		
	}
	
	if (throwing == true)
	{ //if we click while jumping
	    if(!collision_point(anchorX, anchorY, obj_solid, false, true)) && (loop_count < dist) 
		{ //while the anchor is not colliding with a wall and while the loop count is less than dist
	        anchorX += lengthdir_x(hookSpeed, angle); //move anchor coords by length of 1 along our angle
	        anchorY += lengthdir_y(hookSpeed, angle);
	        loop_count += 1;
		} //add to loop count
			

	    if (collision_point(anchorX, anchorY, obj_solid, false, true)) 
		{  //if the anchor collides with a wall         
			show_debug_message("Hook hit!")
	        angle = point_direction(anchorX, anchorY, x, y); //angle now equals the direction between the anchor and our position
	        distance = point_distance(anchorX, anchorY, x, y); //distance now equals the distance between the anchor and our position
	        state = SWINGING; //switch state to swinging
				show_debug_message("Swinging")
	        vsp = 0; //set vertical and horizontal speed to 0
	        hsp = 0;
	        angleVelocity = 0;//set our angle velocity to 0
			throwing = false //we are no longer throwing
		}	
	} 
	if(retracting = true)
	{
		if(anchorX < x)
		{
			anchorX += hookSpeed;
		} 
		else if (anchorX > x)
		{
			anchorX -= hookSpeed;
		}
		
		if(anchorY < y)
		{
			anchorY += hookSpeed;
		} 
		else if (anchorY > y)
		{
			anchorY -= hookSpeed;
		}
		
		if(point_distance(anchorX,anchorY, x, y) < 20)
		{
			retracting = false;
			grappleOut = false;
			with(o_grappleHook)
			{
				instance_destroy()
			}
		}
		
		
	
		
	
		//if(!collision_point(anchorX, anchorY, o_player, false, true)) && (loop_count < dist) 
		//{ //while the anchor is not colliding with a wall and while the loop count is less than dist
		//	angle = point_direction(x, y, anchorX, anchorY ); //set angle to the direction between us and the mouse
		//	dist = point_distance(x, y, anchorX, anchorY); //create a temp var and set dist to equal the distance between us and the mouse
			
	    //    anchorX -= lengthdir_x(hookSpeed, angle); //move anchor coords by length of 1 along our angle
	    //    anchorY -= lengthdir_y(hookSpeed, angle);
	    //    loop_count += 1;
		//} //add to loop count
		//if (collision_point(anchorX, anchorY, o_player, false, true)) 
		//{  //if the anchor collides with a wall         
		//	show_debug_message("Hook retracted!")
		//	retracting = false //we are fully retracted
		//	grappleOut = false //the grapple is no longer out
		//	with(o_grappleHook) 
		//	{
		//		instance_destroy() //destroy the grappling hook instance
		//	}
		//}	
	}
}


		


if (hsp != 0) { //if we're moving horizontally
    image_xscale = sign(hsp); //flip sprite to face the correct way
}
