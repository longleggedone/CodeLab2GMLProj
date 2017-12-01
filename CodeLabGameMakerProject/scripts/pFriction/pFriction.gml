var amount = argument[0];

if (hsp != 0) {
    if (abs(hsp)-amount > 0) {
        hsp -= amount*image_xscale;
    } else {
        hsp = 0;
    }
}
