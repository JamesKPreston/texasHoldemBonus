image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
button_id = "DEBUG";
use_gui = false; 
on_click = function () {
	//controller_texas_holdem_bonus.progressGame(); 
	inst_player.Cards[0].Rank = eRANK.ACE;
	inst_player.Cards[0].Suit = eSUIT.HEARTS;
	inst_player.Cards[1].Rank = eRANK.ACE;
	inst_player.Cards[1].Suit = eSUIT.DIAMONDS;
	
	inst_player.Cards[0].Flip();
	inst_player.Cards[0].Flip();
	inst_player.Cards[1].Flip();
	inst_player.Cards[1].Flip();
	
	inst_dealer.Cards[0].Rank = eRANK.ACE;
	inst_dealer.Cards[0].Suit = eSUIT.CLUBS;
	inst_dealer.Cards[1].Rank = eRANK.ACE;
	inst_dealer.Cards[1].Suit = eSUIT.SPADES;
	
	inst_dealer.Cards[0].Flip();
	inst_dealer.Cards[0].Flip();
	inst_dealer.Cards[1].Flip();
	inst_dealer.Cards[1].Flip();
	
	inst_community.Cards[0].Rank = eRANK.QUEEN;
	inst_community.Cards[0].Suit = eSUIT.CLUBS;
	inst_community.Cards[0].Flip();
	inst_community.Cards[0].Flip();
	inst_community.Cards[1].Rank = eRANK.JACK;
	inst_community.Cards[1].Suit = eSUIT.CLUBS;
	inst_community.Cards[1].Flip();
	inst_community.Cards[1].Flip();
	inst_community.Cards[2].Rank = eRANK.TEN;
	inst_community.Cards[2].Suit = eSUIT.CLUBS;
	inst_community.Cards[2].Flip();
	inst_community.Cards[2].Flip();
	inst_community.Cards[3].Rank = eRANK.NINE;
	inst_community.Cards[3].Suit = eSUIT.CLUBS;
	inst_community.Cards[3].Flip();
	inst_community.Cards[3].Flip();
	inst_community.Cards[4].Rank = eRANK.EIGHT;
	inst_community.Cards[4].Suit = eSUIT.CLUBS;
	inst_community.Cards[4].Flip();
	inst_community.Cards[4].Flip();
	
};
