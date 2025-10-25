var newXpos = xPos;
	newXpos = xPos + 1
	if(point_distance(x,y,newXpos,yPos) > 10) {
		move_towards_point(newXpos,yPos, 10);
	}
	else {
		x = newXpos;
		y = yPos;
		speed = 0;
		var count = scr_count_chips_on_target(payout_target,"Ante Payout");
		scr_position_chip_on_target(self,payout_target,chip_index)
	}