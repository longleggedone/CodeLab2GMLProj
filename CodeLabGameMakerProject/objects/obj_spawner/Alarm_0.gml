//when the alarm goes off
//create an enemy spawn point at a random location, on the enemies layer
instance_create_layer(random(room_width),random(room_height),"Enemies", obj_enemyspawn);
//reset alarm to start value
alarm[0] = spawnrate;