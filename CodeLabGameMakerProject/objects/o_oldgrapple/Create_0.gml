

//direction = direction + random_range(-4,4);// adds a small random value to direction
//speed = 1; //will move 16 pixels per frame
//image_angle = direction; //sets sprite to face direction

hsp = 0; //horizontal speed
vsp = 0; //vertical speed
grav = 0; //gravity
dir = 0; //direction
grounded = 0; //touching ground
clicked = 0;


grappleOut = false; //have we been thrown
bounced = false; //did we not hit something grappleable
returning = false; //are we returning to the player