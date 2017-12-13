draw_self(); //always draw self


if (state = SWINGING) 
{ //if we are swinging
    draw_set_color(c_maroon); 
    draw_circle(anchorX, anchorY, 15, true);//draw a maroon circle at the anchor point
    draw_line(x, y, anchorX, anchorY); //draw a line between us and the anchor
 
   
    
}

//if(grappling)
//{
//	draw_line(x,y,gx,gy); //draw a line from our position to the grapple position
//}