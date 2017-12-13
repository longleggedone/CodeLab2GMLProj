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
            vsp = jumpSpeed;
		}   // set vertical speed to jump speed               

        if (!place_meeting(x, y + 1, obj_solid)) 
		{ //if we are not standing on a wall, switch states to jump
            state = JUMPING;
		}
   
        break;

    //jump state
    case JUMPING: //if jumping            
        hsp = (right - left) * walkSpeed; //horizontal speed is the same as when walking  
        vsp += grav; //gravity is the same as when walking                               
   
        if (place_meeting(x, y + 1, obj_solid)) 
		{ //if we are standing on a wall
            state = WALKING;
		} //switch states to walking                         
   
        if (lMouseClick) 
		{ //if we click while jumping
            angle = point_direction(x, y, mouse_x, mouse_y); //set angle to the direction between us and the mouse
            var dist = point_distance(x, y, mouse_x, mouse_y); //create a temp var and set dist to equal the distance between us and the mouse
            dist = min(dist, maxDistance); //set dist to equal either itself or our max distance, whichever is lower
            var loop_count = 0; //create a var to hold our loop count, start it at 0
            anchorX = x; //set anchor coords to begin at ours
            anchorY = y;
       
            while (!collision_point(anchorX, anchorY, obj_solid, false, true)) && (loop_count < dist) 
			{ //while the anchor is not colliding with a wall and while the loop count is less than dist
                anchorX += lengthdir_x(1, angle); //move anchor coords by length of 1 along our angle
                anchorY += lengthdir_y(1, angle);
                loop_count += 1;
			} //add to loop count

            if (collision_point(anchorX, anchorY, obj_solid, false, true)) 
			{  //if the anchor collides with a wall         
                angle = point_direction(anchorX, anchorY, x, y); //angle now equals the direction between the anchor and our position
                distance = point_distance(anchorX, anchorY, x, y); //distance now equals the distance between the anchor and our position
                state = SWINGING; //switch state to swinging
                vsp = 0; //set vertical and horizontal speed to 0
                hsp = 0;
                angleVelocity = 0;
			}
		} //set our angle velocity to 0

           
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
			} //switch state to jump
       
        if (lMouseClick) 
		{ //if we click
            state = JUMPING;
		} //switch state to jump
       
        if (jump) 
		{ //if we press space 
            vsp = jumpSpeed;//set vertical speed to jump speed
            state = JUMPING;
		} //switch state to jump
       
        break;
}

//if (!place_meeting(x, y+1, obj_solid)) { //if we aren't standing on a solid object
//    vsp += grav; //add gravity
    
//    // Control the jump height
//    if (jumpRelease && vsp < -0.1) { //if we let go of jump input and we are rising
//        vsp -= vsp/3; //subtract 1/3rd of our vertical speed
//        hsp = 1*image_xscale; //horizontal speed is equal to our image x scale
//    }
//}else{ //if we're standing on a solid
//    vsp = 0; // vertical speed is 0
//    if (jump) { //if we press the jump input
//        vsp = -jumpheight; //jump!
//    }
//}

//Grapple hook
//if(lMouseClick && !grappleOut){ //if the mouse is clicked and a hook is not out
//    grappleOut = true; //set grappleOut to true
//    instance_create_depth(x,y, -10, o_grappleHook); //create a hook at the player position
//}else if(lMouseRelease && grappleOut == 1){ //if the mouse is released and there is a hook out
//    grappleOut = false; //the hook is no longer out and we are not grappling
//    grappling = false;
//    with(o_grappleHook){instance_destroy()} //destroy the current hook
   
//}

//if(grappling == true){ //if we are grappling
	
	
//	if(point_distance(x,y,o_grappleHook.x,o_grappleHook.y) > 100){ //if we are farther than 100 away from the hook
//		if(y < o_grappleHook.y){ //if we are above the hook
//	        vsp += 0.2; //increase our downward speed
//		}else if(y > o_grappleHook.y){ //if we are below the hook
//	        vsp -= 0.2; //increase our upward speed
//		}
//	}
	
//	if(x>o_grappleHook.x){ //if we are to the right of the hook
//        hspd_dir = -1; //increase our leftward speed direction
//	}else if(x<o_grappleHook.x){ //if we are to the left of the hook
//        hspd_dir = 1; //increase our rightward speed direction
//	}
   
//	hsp += hspd_dir*0.25; //add a frlMouseClick of our horizontal direction to our horizontal speed
   
//	grav = 0.05; //lessen gravity
   
//}else{grav = 0.1}; //otherwise return gravity to normal

////Right/Left Movement

//if (right || left) { //if inputting for moving right or left
//	if(!grappling){
//		ropeSpdMod = 1;
//	}else{
//		ropeSpdMod = 0.2;
//	}
//	    hsp += (right-left)*acceleration ; //increase horizontal speed by the correct ammount
//	    hspd_dir = right - left; //update the direction of your horizontal movement
    
//	    if (hsp > spd) hsp = spd;   //
//	    if (hsp < -spd) hsp = -spd;
	
	
//} else {
//    pFriction(acceleration); //if we've stopped input, apply friction using acceleration
//} 

if (hsp != 0) { //if we're moving horizontally
    image_xscale = sign(hsp); //flip sprite to face the correct way
}
