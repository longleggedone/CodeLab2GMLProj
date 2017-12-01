
direction = point_direction(x,y,mouse_x, mouse_y); //points bullet in direction of mouse cursor
//direction = direction + random_range(-4,4);// adds a small random value to direction
speed = 16; //will move 16 pixels per frame
image_angle = direction; //sets sprite to face direction

oldDir = direction; //initialize old direction as our starting direction
bounced = false; //have we changed direction since firing, meaning we have bounced off of something
returning = false; //are we returning to the player
grappled = false; //have we hit something grappleable and are still holding down the mouse button