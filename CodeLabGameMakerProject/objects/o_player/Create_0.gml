
//gx = x; //coords for the hook
//gy = y;


//states
WALKING = 0;
JUMPING = 1;
GRAPPLING = 2;
SWINGING = 3;

state = WALKING; //our state which starts as walking

//movement
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
walkSpeed = 5;
jumpSpeed = -5;

//swing variables
facing = 1; //which way the character is facing
anchorX = 0; //our anchor point coords
anchorY = 0;
maxDistance = 250; //maximum distance we can get from the anchor point
angleAcceleration= 1; //rate of change in angular velocity
angleVelocity = 0; //how fast our angle is changing
angle = 0; //our current angle
distance = 0; //our distance from the anchor point



//acceleration = 0.2; 
//spd = 5; //speed multiplier

grav = 0.1;
//jumpheight = 6.2;

grappling = false; //are we grappling?
grappleOut = false; //have we fired the grapple?

haveDied = false;