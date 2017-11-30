if(place_meeting(x - hspeed, y, o_block)) //if colliding from the left, counteract the speed
{
	x += hspeed
}
if(place_meeting(x + hspeed, y, o_block)) //if colliding from the right, counteract the speed
{
	x -= hspeed
}

if(other.y < y && !place_free(x, y + vspeed)) //if colliding from above with something solid
{
	move_contact_solid (90, 8); //move up until no longer colliding
	vspeed = 0; //stop vertical movement
}

if(other.y < y && !place_free(x, y + vspeed)) //if colliding from above with something solid
{
	move_contact_solid (90, 8); //move up (90 degrees) until no longer colliding
	vspeed = 0; //stop vertical movement
}

if(place_meeting(x,y+vspeed, o_block)) //if colliding from below
{
	vspeed = 0;
	move_contact_solid(270,12); //move down (270 degrees) until no longer colliding
}