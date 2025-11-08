/// obj_button: Step
// Get mouse position in the correct space
var mx, my;
if (use_gui) {
    mx = device_mouse_x_to_gui(0);
    my = device_mouse_y_to_gui(0);
} else {
    mx = mouse_x;
    my = mouse_y;
}

// Is mouse over this instance's current mask/bbox?
var over = point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom);

// Begin press only if inside
if (over && mouse_check_button_pressed(mb_left)) {
    pressed_inside = true;
    image_index = 1; // show pressed
}

// While the mouse is held down, stay in pressed frame if we started inside
if (pressed_inside && mouse_check_button(mb_left)) {
    image_index = 1;
}

// On release: fire click only if we started inside AND are still over
if (mouse_check_button_released(mb_left)) {
    if (pressed_inside && over) {
        if (is_undefined(on_click) == false) on_click();
    }
    pressed_inside = false;
    image_index = 0; // return to normal
}

// If we started inside but dragged off, visually show normal (classic button behavior)
if (pressed_inside && !over && mouse_check_button(mb_left)) {
    image_index = 0;
}

// If nothing is pressed, ensure normal
if (!mouse_check_button(mb_left) && !pressed_inside) {
    image_index = 0;
}

