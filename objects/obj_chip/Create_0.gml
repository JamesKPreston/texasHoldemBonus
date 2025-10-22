is_dragging = false;
spawned_replacement_this_drag = false;

drag_dx = 0;
drag_dy = 0;

// optional: chip data you want new copies to inherit
chip_value = 5;
drop_target = noone;   // the ante we're hovering over while dragging
drag_front_depth = -1000000; // super front during drag

targetName = "ANTE";
bet_target = obj_bet;
// If you want it even tighter, delete the items with 2s, or set a scale < 1 (see below).
