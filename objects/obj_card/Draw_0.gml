// Draw Event
var spr_w = sprite_get_width(sprite_index);
var spr_h = sprite_get_height(sprite_index);
image_xscale = card_width / spr_w;
image_yscale = card_height / spr_h;

//// compute uniform scale that fits
//var s = min(width_target / spr_w, height_target / spr_h);

////// save current scale
////var old_x = image_xscale;
////var old_y = image_yscale;

//// apply uniform scale
//image_xscale = s;
//image_yscale = s;

//// draw normally at this scale
draw_self();