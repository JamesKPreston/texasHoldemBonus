// === Scale to 90x129 relative to the source 242x348 ===
var spr_w = sprite_get_width(sprite_index);   // 242
var spr_h = sprite_get_height(sprite_index);  // 348
image_xscale = 90  / spr_w;
image_yscale = 129 / spr_h;

// Where to draw (with community nudge)
var draw_x = x;
var draw_y = y + y_offset;

// --- Compute scaled bounds from sprite origin (origin-safe) ---
var sx = abs(image_xscale);
var sy = abs(image_yscale);
var ox = sprite_get_xoffset(sprite_index) * sx;
var oy = sprite_get_yoffset(sprite_index) * sy;

var w = spr_w * sx;   // -> 90
var h = spr_h * sy;   // -> 129

var left   = draw_x - ox;
var top    = draw_y - oy;
var right  = left + w;
var bottom = top  + h;

// 1) Draw the card
draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// 2) High-visibility highlight ON TOP
if (highlight_alpha > 0.02) {
    // Pads chosen for 90x129; tweak as you like
    var pad_fill = 12;
    var pad_line =  8;

    // 2a) Additive fill halo
    gpu_set_blendmode(bm_add);
    draw_set_alpha(clamp(highlight_alpha * 0.8, 0, 1));
    draw_set_color(c_yellow);
    draw_roundrect(left - pad_fill, top - pad_fill, right + pad_fill, bottom + pad_fill, false);

    // 2b) "Thick" outline using concentric 1px outlines (portable)
    draw_set_alpha(clamp(highlight_alpha, 0, 1));
    draw_set_color(c_white);
    var rings = 3, step_px = 2;
    for (var i = 0; i < rings; i++) {
        var o = pad_line - (i * step_px);
        draw_roundrect(left - o, top - o, right + o, bottom + o, true);
    }

    // 2c) Optional: additive sheen over the card art
    draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, image_yscale, image_angle,
                    make_color_rgb(255,240,0), clamp(highlight_alpha*0.35, 0, 1));

    // Restore state
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
