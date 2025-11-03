// Inherit the parent event
event_inherited();

// If you want it even tighter, delete the items with 2s, or set a scale < 1 (see below).

disabled = true;
payout_target = obj_bet_target;
image_xscale = .24;
image_yscale = .24;
xPos = payout_target.x;
yPos = payout_target.y;
chip_index = 0;