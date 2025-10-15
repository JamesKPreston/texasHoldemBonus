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

