//increase image size until it reaches 100%
image_xscale = min(image_xscale + 0.02,1);
image_yscale = image_xscale;
//if the image has reached its full size, switch this to enemy object
//instance_change swaps this object for another
if (image_xscale == 1) instance_change(obj_enemy, true);