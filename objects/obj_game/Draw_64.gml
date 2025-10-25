/// obj_game: Draw GUI
if (show_winner) {
    var w = display_get_gui_width();
    var h = display_get_gui_height();

    // dark overlay
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, w, h, false);
    draw_set_alpha(1);

    // winner banner
    var msg = winner_text;
    var pad = 24;
    var tw  = string_width(msg) + pad * 2;
    var th  = string_height(msg) + pad * 2;
    x   = (w - tw) * 0.5;
    y   = (h - th) * 0.4;

    draw_set_color(c_black);
    draw_roundrect(x, y, x + tw, y + th, false);
    draw_set_color(c_white);
    draw_roundrect(x, y, x + tw, y + th, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(winner_color);
    draw_text(x + tw * 0.5, y + th * 0.5, msg);

    // (optional) countdown text
	var steps_per_second = game_get_speed(gamespeed_fps);
	var secs_left = max(0, alarm[ALRM.WINNER]) / steps_per_second;

    draw_set_color(c_ltgray);
    draw_text(w * 0.5, y + th + 24, "Next hand in " + string_format(secs_left, 1, 1) + "s");
}
