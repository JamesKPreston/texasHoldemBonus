/// poker_showdown(hero2, dealer2, board5)
/// hero2/dealer2: arrays of 2 card structs  [{rank:..,suit:..}, {..}]
/// board5: array of 5 card structs
/// Returns: {
///   result:  1 (hero wins) | -1 (dealer wins) | 0 (tie),
///   hero:    <eval struct from poker_best5_from7>,
///   dealer:  <eval struct from poker_best5_from7>,
///   message: string (human-friendly)
/// }
function poker_showdown(hero2, dealer2, board5) {
    // Build 7-card sets
    var hero7   = [ hero2[0], hero2[1], board5[0], board5[1], board5[2], board5[3], board5[4] ];
    var dealer7 = [ dealer2[0], dealer2[1], board5[0], board5[1], board5[2], board5[3], board5[4] ];

    var he = poker_best5_from7(hero7);
    var de = poker_best5_from7(dealer7);

    var cmp = __poker_compare(he.tiebreak, de.tiebreak);
    var msg;
    if (cmp > 0) {
        msg = "Player wins with " + he.label + " vs Dealer's " + de.label;
    } else if (cmp < 0) {
        msg = "Dealer wins with " + de.label + " vs Player's " + he.label;
    } else {
        msg = "Tie: both have " + he.label;
    }

    return { result: cmp, hero: he, dealer: de, message: msg };
}
