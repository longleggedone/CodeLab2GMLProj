//rendering of any kind has to happen in a draw event, which happens once per frame
//'var' keyword is used for temporary variables, which will be automatically disposed of at the end of the event
//variables for camera's x and y position
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
//variable for camera width
var cw = camera_get_view_width(view_camera[0]);
//sets font and color to be used
draw_set_font(fnt_score);
draw_set_color(c_white);
//draw text at top middle of screen
draw_text(cx + cw / 2, cy + 25, string(thescore));