/// scr_destroy_chips_on_target(target, name)
function scr_destroy_chips_on_target(_target, _name)
{
    with (Chip)
    {
        if (bet_target == _target && targetName == _name) alarm[0] = 1;
    }
}