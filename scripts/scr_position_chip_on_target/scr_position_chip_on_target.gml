/// scr_position_chip_on_target(inst, target, idx)
/// Uses target.stack_dx/dy/wrap to place chip "idx" in the stack.
function scr_position_chip_on_target(_inst, _target, _idx)
{
    var dx   = is_undefined(_target.stack_dx)   ? 6 : _target.stack_dx;
    var dy   = is_undefined(_target.stack_dy)   ? 6 : _target.stack_dy;
    var wrap = is_undefined(_target.stack_wrap) ? 6 : _target.stack_wrap;

    var cx = _target.x;
    var cy = _target.y;

    var col = (wrap > 0) ? (_idx mod wrap) : _idx;
    var row = (wrap > 0) ? (_idx div wrap) : 0;

    var px = cx + col * dx;
    var py = cy + row * dy;

    _inst.x = px;
    _inst.y = py;

    // draw later chips above earlier ones
    _inst.depth = -py - (_idx + 1);
}