// Inherit the parent event
event_inherited();

button_id="CHECK";

on_click = function () {
		if(obj_game.ante == 0) {return;}
    // Replace with your action
    show_debug_message("BET Button clicked!");
	scr_game_stage();
}