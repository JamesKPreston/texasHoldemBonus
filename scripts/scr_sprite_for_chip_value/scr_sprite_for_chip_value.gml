/// scr_sprite_for_chip_value(value) -> sprite asset
function scr_sprite_for_chip_value(_v)
{
    switch (_v) {
        case 1:   return spr_chip_one;
        case 5:   return spr_chip_five;
        case 25:  return spr_chip_twenty_five;
        case 100: return spr_chip_one_hundred;
        default:  return spr_chip_one; // fallback
    }
}