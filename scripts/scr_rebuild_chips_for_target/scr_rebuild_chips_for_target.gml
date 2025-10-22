/// scr_rebuild_chips_for_target(target, name, total, [denoms])
/// Rebuilds the visual stack to the *fewest* chips representing "total".
function scr_rebuild_chips_for_target(_target, _name, _total, _denoms)
{
    var change = chips_for_amount(_total, (argument_count >= 4) ? _denoms : [100,25,5,1]);

    // Only rebuild if it reduces chip count (or if there are 0 but total > 0)
    var current = scr_count_chips_on_target(_target, _name);
    if (current > 0 && current <= change.total_chips) {
        return; // no improvement
    }

    // Guard so created chips don’t re-enter the rebuild block
    obj_game.is_rebuilding = true;

    // Clear existing chips for this target/name
    scr_destroy_chips_on_target(_target, _name);

    _target.stack_count = 0;
    var layer_name = layer_get_name(_target.layer);

    // Spawn chips in optimal order (big -> small)
    var denoms = change.denoms;
    var counts = change.counts;

    for (var i = 0; i < array_length(denoms); i++)
    {
        var v = denoms[i];
        var c = counts[i];

        for (var k = 0; k < c; k++)
        {
            var inst = instance_create_layer(_target.x, _target.y, layer_name, obj_chip);
            inst.chip_value  = v;
            inst.sprite_index = scr_sprite_for_chip_value(v);
            inst.bet_target  = _target; // so we can find/destroy later
            inst.targetName  = _name;

            // place using current stack_count, then increment
            scr_position_chip_on_target(inst, _target, _target.stack_count);
            _target.stack_count++;
        }
    }

    obj_game.is_rebuilding = false;
}