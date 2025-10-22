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
		if(targetName = "ANTE")
		{
			obj_game.ante += chip_value;

		    // mark this chip as belonging to this target so it can be managed
		    bet_target = obj_ante;
		    targetName = "ANTE";

		    if (!obj_game.is_rebuilding)
		    {
		        // Rebuild if a fewer-chip representation exists
		        var denomsAnte = [100, 25, 5, 1];
		        scr_rebuild_chips_for_target(bet_target, "ANTE", obj_game.ante, denomsAnte);
		    }
		}
		if(targetName = "BONUS") 
		{
			obj_game.bonus += chip_value;
			bet_target = drop_target;
		}

		obj_game.player_total_bet = obj_game.ante + obj_game.bonus;
		obj_chip_bank.text_value = obj_game.player_total_bet;
		obj_chip_bank.text_description = string(obj_game.player_total_bet);
		show_debug_message("Ante : " + string(obj_game.ante) );
		show_debug_message("Total : " + string(obj_game.player_total_bet ) );

    }
	else {
		instance_destroy();
	}
    drop_target = noone;
}
