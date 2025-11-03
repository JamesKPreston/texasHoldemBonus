

card_width = 90;
card_height = 129;
deck_buffer_x = .4;
deck_buffer_y = .4;
var Cards = [];

//Functions

function InitDeck() {
    self.Cards = [];
    for (var s = 0; s < 4; s++) {
        for (var r = 0; r < 13; r++) {
            var c = instance_create_layer(x, y, "Instances", Card);
            with (c) {
                Suit = s;
                Rank = r;
                scale(90, 129);
            }
            array_push(self.Cards, c);
        }
    }
	Shuffle();
}

function Shuffle() {
    var n = array_length(self.Cards);
    if (n <= 1) return;

    randomize(); 

    for (var i = n - 1; i > 0; i--) {
        var j = irandom(i); // 0..i
        if (j != i) {
            var tmp        = self.Cards[i];
            self.Cards[i]  = self.Cards[j];
            self.Cards[j]  = tmp;
        }
    }
}

function DrawCards(numberOfCards) {
	 // Returns an array of dealt card instances
    var drawn = [];
    var want  = max(0, numberOfCards);
    var have  = array_length(self.Cards);
    var take  = min(want, have);

    // Where to place on screen (to the right of the deck), tweak as you like
    var base_x   = x + 150;
    var base_y   = y - 50;
    var spacingX = card_width + 30;

    for (var k = 0; k < take; k++) {
        // "Top of deck" = last element in array
        var top_index = array_length(self.Cards) - 1;
        var card = self.Cards[top_index];

        // Remove from deck
        array_delete(self.Cards, top_index, 1);

        // Flip face up and move into view
        with (card) {
            Flip();

            // Put it clearly visible and spaced from others
            x = base_x + (k * spacingX);
            y = base_y;

            // Ensure it draws above the deck (optional)
            depth = -1000;
        }

        array_push(drawn, card);
    }

    return drawn;
}
	
InitDeck()