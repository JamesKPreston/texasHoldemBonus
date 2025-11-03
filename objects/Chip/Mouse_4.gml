if(disabled) return;
// Start dragging this chip
is_dragging = true;

// Remember the offset so the chip doesn't "jump" to the mouse
drag_dx = x - mouse_x;
drag_dy = y - mouse_y;

// make sure it draws above the whole pile while dragging
depth = drag_front_depth;

// Spawn a replacement only once per drag
if (!spawned_replacement_this_drag) {
    var repl = instance_create_layer(x, y, layer, object_index);

    // Copy any state you care about
    repl.chip_value   = chip_value;
    repl.sprite_index = sprite_index;
    repl.image_index  = image_index;
    repl.image_xscale = image_xscale;
    repl.image_yscale = image_yscale;

    spawned_replacement_this_drag = true;
}

