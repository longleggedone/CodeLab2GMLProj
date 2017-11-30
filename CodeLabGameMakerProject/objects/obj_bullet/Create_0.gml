//set up movement 
direction = point_direction(x,y,mouse_x, mouse_y); //points bullet in direction of mouse cursor
direction = direction + random_range(-4,4);// adds a small random value to direction
speed = 16; //will move 16 pixels per frame
image_angle = direction; //sets sprite to face direction