/// obj_button: Create
// Config
image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
use_gui = false;              // set true if you draw this button in Draw GUI

// Optional: assign a callback to run on click
on_click = function () {
    // Replace with your action
    show_debug_message("Button clicked!");
};
