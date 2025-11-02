enum Target { ANTE, FLOP, TURN , RIVER, BONUS};
// how many chips currently stacked on this ante
stack_count = 0;

// visual spacing between chips (pixels)
stack_dx = 5;
stack_dy = 5;

// how many chips before we wrap to the next "row" of the diagonal pattern
stack_wrap = 3;

// If your ante sprite origin is centered, set this true for simpler math.
origin_is_centered = true;

target_id = Target.ANTE;