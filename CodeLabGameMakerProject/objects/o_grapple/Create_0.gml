/// @description Insert description here
// You can write your code in this editor
direction = point_direction(x,y,mouse_x, mouse_y); //points bullet in direction of mouse cursor
//direction = direction + random_range(-4,4);// adds a small random value to direction
speed = 16; //will move 16 pixels per frame
image_angle = direction; //sets sprite to face direction

oldDir = direction;
bounced = false;
returning = false;
grappled = false;