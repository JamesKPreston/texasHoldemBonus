if(card_drawn) {
	if(alarm[0] == -1) {
		alarm[0] = 1;
	}
}
if(card_in_hand) {
	var newXpos = xPos;
	newXpos = xPos + player.handCount/2*(card_width + 3) + card_width / 2 +(3 + card_width) * hand_position;
	if(point_distance(x,y,newXpos,yPos) > 10) {
		move_towards_point(newXpos,yPos, 10);
	}
	else {
		x = newXpos;
		y = yPos;
		speed = 0;
	}
}

if (keyboard_check_pressed(ord("H")) && position_meeting(mouse_x, mouse_y, id)) {
    is_winning = true;
    if (is_community) target_y_offset = 6;
}

y_offset        = lerp(y_offset, target_y_offset, 0.20);
highlight_alpha = lerp(highlight_alpha, is_winning ? 0.40 : 0.0, 0.25);
