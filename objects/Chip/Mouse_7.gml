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
		var denoms = [100, 25, 5, 1];
        // Keep later chips drawing above earlier ones
        depth = -py - drop_target.stack_count;
		if(targetName = "ANTE")
		{
			controller_texas_holdem_bonus.ante += chip_value;

		    // mark this chip as belonging to this target so it can be managed
		    bet_target = inst_ante;

		    if (!controller_texas_holdem_bonus.is_rebuilding)
		    {
		        scr_rebuild_chips_for_target(bet_target, targetName, controller_texas_holdem_bonus.ante, denoms);
		    }
		}
		if(targetName = "BONUS") 
		{
			controller_texas_holdem_bonus.bonus += chip_value;
			bet_target = inst_bonus;
			if (!controller_texas_holdem_bonus.is_rebuilding)
		    {
		        scr_rebuild_chips_for_target(bet_target, targetName, controller_texas_holdem_bonus.bonus, denoms);
		    }
		}

		controller_texas_holdem_bonus.player_total_bet = controller_texas_holdem_bonus.ante + controller_texas_holdem_bonus.bonus;
		obj_chip_bank.text_value = controller_texas_holdem_bonus.player_total_bet;
		obj_chip_bank.text_description = string(controller_texas_holdem_bonus.player_total_bet);
		//show_debug_message("Ante : " + string(obj_game.ante) );
		//show_debug_message("Total : " + string(obj_game.player_total_bet ) );

    }
	else {
		instance_destroy();
	}
    drop_target = noone;
}
