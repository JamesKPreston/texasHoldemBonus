function scr_show_winning_hand(){
	with (obj_hand) {
		highlightCards();
	}
}

function highlightCards() {
			// Loop through arrayA and look for matching ids in arrayB
		for (var i = 0; i < array_length(handCard); i++) {
		    var cardNum = handCard[i].cardNum;

		    // inner loop to check arrayB for same id
		    for (var j = 0; j < array_length(best5); j++) {
		        if (best5[j].id == cardNum) {
		            // Example modification: add the values together
		           handCard[i].is_winning = true;

		            // Optional: break if you only expect one match per id
		            break;
		        }
		    }
		}
}