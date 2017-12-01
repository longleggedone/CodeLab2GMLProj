if(instance_place(x,y+vspeed,obj_solid)){ //if we are toucing something solid
   speed = 0; //set speed to 0
   o_player.grappling = true; //set grappling to true
   
}

if(distance_to_object(o_player) > 256){ //if the hook goes 256 pixels without hitting anything
    o_player.grappleOut = false; // set bools to false
    o_player.grappling = false; //
    instance_destroy(); //destroy this hook
}


