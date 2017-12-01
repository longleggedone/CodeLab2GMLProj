x = o_player.x;
y = o_player.y;

camera = camera_create();
//creates view matrix, the point in space for our camera, where it is looking, and what it considers to be up
//looking from z of -10, toward z of 0, considering y as up
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
//creates projection matrix, with width and height of viewport and min/max viewing distances
var pm = matrix_build_projection_ortho(1024,768,1,10000);
//assign these matrices to the camera
camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);
//assign camera to viewport
view_camera[0] = camera;

//object to follow, x and y coordinates to move to
follow = o_player;
xTo = x;
yTo = y;

