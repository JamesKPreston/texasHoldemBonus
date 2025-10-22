/// scr_count_chips_on_target(target, name) -> count
function scr_count_chips_on_target(_target, _name)
{
    var cnt = 0;
    with (obj_chip)
    {
        if (bet_target == _target && targetName == _name) cnt++;
    }
    return cnt;
}