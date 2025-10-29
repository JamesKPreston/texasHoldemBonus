/// obj_button: Create
// Config
image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
use_gui = false;        
player = obj_card_player;
dealer = obj_card_dealer;
flop = obj_card_flop;
turn = obj_card_turn;
river = obj_card_river;

player_hand = obj_hand_player;
dealer_hand = obj_hand_dealer;
flop_hand = obj_hand_flop;
turn_hand = obj_hand_turn;
river_hand = obj_hand_river;

button_id = "default";

// Optional: assign a callback to run on click
on_click = function () {
    // Replace with your action
    show_debug_message("Button clicked!");
};
