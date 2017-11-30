//if an instance of player exists
if (instance_exists(obj_player))
{
	//move towards the player position at speed
	move_towards_point(obj_player.x, obj_player.y, spd)
}
//orient the angle of our image toward our movement direction
image_angle = direction;
//if hit points reach 0 or less 
if (hp <= 0)
{
	//add 5 to score
	with(obj_score) thescore += 5;
	//play sound without looping, at a random pitch
	audio_sound_pitch(snd_death,random_range(0.8, 1.2));
	audio_play_sound(snd_death,0,0);
	//destroy ourselves
	instance_destroy();
}