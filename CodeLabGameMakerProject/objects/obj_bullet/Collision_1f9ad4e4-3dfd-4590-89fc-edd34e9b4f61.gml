//'with' allows us to affect another object from this object
//'other' refers to the object we collided with
with(other)
{
	hp -= 1;
}

//destroy this bullet when it collides with an enemy
instance_destroy();
