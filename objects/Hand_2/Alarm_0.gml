
if (array_length(Cards) < maxHand) {
    // Deal two cards
    Cards = Deck_2.DrawCards(maxHand);

    // Flip ONCE now (not every step), and scale
    for (var i = 0; i < array_length(Cards); i++) {
        var c = Cards[i];
        if (!instance_exists(c)) continue;
		var _handState = self.handState;
        with (c) {
			if(_handState == eFACESTATE.FACEDOWN) {
				FLIP();
			}
            scale(90, 129);
        }

        // optional: mark as not yet settled
        c.__settled = false;
    }
} else {
    var cx = x;
    var cy = y + target_y_offset;
    var spacing = card_spacing;
    var rate = lerp_rate;
    var eps = 0.75; // snap threshold in pixels

    for (var i = 0; i < maxHand; i++) {
        var c = Cards[i];
        if (!instance_exists(c)) continue;

        var tx = cx + ((i - 0.5) * spacing);
        var ty = cy;

        // If already settled, just ensure final placement and layering
        if (c.__settled) {
            c.x = tx;
            c.y = ty;
            c.depth = -1000 - i;
            continue;
        }

        // Move towards target
        c.x = lerp(c.x, tx, rate);
        c.y = lerp(c.y, ty, rate);
        c.depth = -1000 - i;

        // Snap & mark settled when close enough
        if (abs(c.x - tx) <= eps && abs(c.y - ty) <= eps) {
            c.x = tx;
            c.y = ty;
            c.__settled = true;
        }
    }
}
