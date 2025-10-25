function scr_payout_animation(target,total){
	var change  = chips_for_amount(total,[100,25,5,1]);
	var chipIndex = 0;
	var chip = noone;
	for(i = 0; i < array_length(change.counts); i ++)
	{
		for(j = 0; j < change.counts[i]; j ++)
		{
				chip = instance_create_layer(1200,200,"Instances",obj_chip_payout);
				chip.payout_target = target;
				chip.xPos = target.x;
				chip.yPos = target.y;
				chip.chip_index = chipIndex;
				chipIndex ++;
			switch(i) {
				case 0:	
					chip.sprite_index = spr_chip_one_hundred;
					break;
				case 1:
					chip.sprite_index = spr_chip_twenty_five;
					break;
				case 2:
					chip.sprite_index = spr_chip_five;
					break;
				case 3:
					chip.sprite_index = spr_chip_one;
					break;
			}
		}
	}
				
}