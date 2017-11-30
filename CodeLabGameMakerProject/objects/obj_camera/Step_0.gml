//move 1/25th the distance between where we want to be and where we are
x += (xTo - x)/25;
y += (yTo - y)/25;
//if we are following something
if(follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}

//update viewport matrix with new x and y values
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
//apply updated matrix to camera
camera_set_view_mat(camera,vm);