if (is_dragging) {
    // existing drag follow
    x = mouse_x + drag_dx;
    y = mouse_y + drag_dy;

    // check for an ante under this chip while dragging
    var hit = instance_place(x, y, obj_ante);
    if (hit != noone) {
        drop_target = hit;       // remember it for when we release
        // (optional) give visual feedback: hit.image_blend = c_yellow;
		targetName = "ANTE";
    } 
	
	// check for an ante under this chip while dragging
    var hit2 = instance_place(x, y, obj_bonus);
    if (hit2 != noone) {
        drop_target = hit2;       // remember it for when we release
        // (optional) give visual feedback: hit.image_blend = c_yellow;
		targetName = "BONUS";
    } 
	
	if(hit == noone && hit2 == noone) {
		 drop_target = noone;
	}
}