if (is_dragging) {
    is_dragging = false;

    if (instance_exists(drop_target)) {
        // --- Safeguard defaults in case an ante was missing them
        var dx   = is_undefined(drop_target.stack_dx)   ? 6 : drop_target.stack_dx;
        var dy   = is_undefined(drop_target.stack_dy)   ? 6 : drop_target.stack_dy;
        var wrap = is_undefined(drop_target.stack_wrap) ? 6 : drop_target.stack_wrap;

        // Base center of the ante (assumes centered origin)
        var cx = drop_target.x;
        var cy = drop_target.y;

        // Which slot is next?
        var idx = drop_target.stack_count;    // 0-based
        var col = wrap > 0 ? (idx mod wrap) : idx;   // guard against wrap=0
        var row = wrap > 0 ? (idx div wrap) : 0;

        // Apply offsets
        var px = cx + col * dx;
        var py = cy + row * dy;

     
        x = px; y = py;

        drop_target.stack_count = idx + 1;

        // Keep later chips drawing above earlier ones
        depth = -py - drop_target.stack_count;

    }
	else {
		instance_destroy();
	}
    drop_target = noone;
}
