


if (!place_meeting(x, y+1, obj_solid)) { //if we aren't standing on a solid object
    vsp += grav; //add gravity
    
    // Control the jump height
    if (jump_release && vsp < -0.1) { //if we let go of jump input and we are rising
        vsp -= vsp/3; //subtract 1/3rd of our vertical speed
        hsp = 1*image_xscale; //horizontal speed is equal to our image x scale
    }
}else{ //if we're standing on a solid
    vsp = 0; // vertical speed is 0
    if (jump) { //if we press the jump input
        vsp = -jumpheight; //jump!
    }
}

//Grapple hook
if(lMouseClick && !grappleOut){ //if the mouse is clicked and a hook is not out
    grappleOut = true; //set grappleOut to true
    instance_create_depth(x,y, -10, o_grappleHook); //create a hook at the player position
}else if(lMouseRelease && grappleOut == 1){ //if the mouse is released and there is a hook out
    grappleOut = false; //the hook is no longer out and we are not grappling
    grappling = false;
    with(o_grappleHook){instance_destroy()} //destroy the current hook
   
}

if(grappling == true){ //if we are grappling
	
	
	if(point_distance(x,y,o_grappleHook.x,o_grappleHook.y) > 100){ //if we are farther than 100 away from the hook
		if(y < o_grappleHook.y){ //if we are above the hook
	        vsp += 0.2; //increase our downward speed
		}else if(y > o_grappleHook.y){ //if we are below the hook
	        vsp -= 0.2; //increase our upward speed
		}
	}
	
	if(x>o_grappleHook.x){ //if we are to the right of the hook
        hspd_dir = -1; //increase our leftward speed direction
	}else if(x<o_grappleHook.x){ //if we are to the left of the hook
        hspd_dir = 1; //increase our rightward speed direction
	}
   
	hsp += hspd_dir*0.25; //add a fraction of our horizontal direction to our horizontal speed
   
	grav = 0.05; //lessen gravity
   
}else{grav = 0.1}; //otherwise return gravity to normal

//Right/Left Movement

if (right || left) { //if inputting for moving right or left
	if(!grappling){
		ropeSpdMod = 1;
	}else{
		ropeSpdMod = 0.2;
	}
	    hsp += (right-left)*acceleration ; //increase horizontal speed by the correct ammount
	    hspd_dir = right - left; //update the direction of your horizontal movement
    
	    if (hsp > spd) hsp = spd;   //
	    if (hsp < -spd) hsp = -spd;
	
	
} else {
    pFriction(acceleration); //if we've stopped input, apply friction using acceleration
} 

if (hsp != 0) { //if we're moving horizontally
    image_xscale = sign(hsp); //flip sprite to face the correct way
}
