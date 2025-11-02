/// =========================
/// Poker Hand Evaluator (7 -> best 5)
/// =========================
/// Card format: { rank: 2..14, suit: 0..3 }  (Ace = 14)
/// Input: array of 7 such card structs
/// Output: struct {
///   category: real (8..0),
///   category_name: string,
///   tiebreak: array,        // for comparisons
///   best5: array of 5 card structs in the best hand order,
///   label: string           // human-readable like "Full House, Aces over Tens"
/// }


function Determine_winner() {
	var dealerHand = "";
	var playerHand = "";
	var communityHand = "";
	
	with(Hand) {
		switch(handType) {
			case "Dealer":
				dealerHand = self;
			break;
			case "Player":
				playerHand = self;
			break;
			case "Community":
				communityHand = self;
			break;
		}
	}
	
	return poker_showdown(playerHand.Cards, dealerHand.Cards, communityHand.Cards);
	
}

function poker_best5_from7(cards7) {
    // Sanity
    if (array_length(cards7) != 7) {
        show_debug_message("poker_best5_from7: expected exactly 7 cards");
        return undefined;
    }

    var best = undefined;
    var best_score = undefined;
    var best5 = undefined;

    // Generate all 5-card combos (i<j<k<l<m)
    for (var i = 0; i < 3; i++) {
        for (var j = i + 1; j < 4; j++) {
            for (var k = j + 1; k < 5; k++) {
                for (var l = k + 1; l < 6; l++) {
                    for (var m = l + 1; m < 7; m++) {
                        var hand5 = [ cards7[i], cards7[j], cards7[k], cards7[l], cards7[m] ];
                        var eval = __poker_eval5(hand5); // {category, tiebreak, name}
                        if (best_score == undefined || __poker_compare(eval.tiebreak, best_score) > 0) {
                            best_score = eval.tiebreak;
                            best = eval;
                            best5 = hand5;
                        }
                    }
                }
            }
        }
    }

    // Build label + output
    var label = __poker_build_label(best.category, best.tiebreak);
    return {
        category: best.category,
        category_name: __poker_category_name(best.category),
        tiebreak: best.tiebreak,
        best5: __poker_order_best5(best.category, best.tiebreak, best5),
        label: label
    };
}

// ===== Core 5-card evaluator =====
// Returns { category:8..0, tiebreak:[category, ...desc-values] }
function __poker_eval5(cards5) {
    // Extract ranks/suits
    var r = [cards5[0].Rank, cards5[1].Rank, cards5[2].Rank, cards5[3].Rank, cards5[4].Rank];
    var s = [cards5[0].Suit, cards5[1].Suit, cards5[2].Suit, cards5[3].Suit, cards5[4].Suit];

    // Sort ranks desc
    r = __poker_sort_desc(r);

    // Count suits
    var suit_counts = [0,0,0,0];
    for (var i = 0; i < 5; i++) suit_counts[s[i]]++;

    var is_flush = false;
    var flush_suit = -1;
    for (var su = 0; su < 4; su++) {
        if (suit_counts[su] == 5) { is_flush = true; flush_suit = su; break; }
    }

    // Rank counts (2..14 -> index)
    var rank_counts = array_create(15, 0);
    for (var i2 = 0; i2 < 5; i2++) rank_counts[r[i2]]++;

    // Build groups like [{rank:14, count:2}, ...] and sort by (count desc, rank desc)
    var groups = [];
    for (var vr = 0; vr <= 14; vr++) {
        if (rank_counts[vr] > 0) array_push(groups, { rank: vr, count: rank_counts[vr] });
    }
    groups = __poker_sort_groups(groups);

    // Detect straight (handle wheel A-2-3-4-5)
    var straight_high = __poker_straight_high(r);

    // Straight Flush?
    var is_straight = (straight_high > 0);
    if (is_flush && is_straight) {
        // But ensure the straight actually uses the flush suit
        // Collect ranks of the flush suit
        var flush_ranks = [];
        for (var i3 = 0; i3 < 5; i3++) if (s[i3] == flush_suit) array_push(flush_ranks, r[i3]);
        flush_ranks = __poker_unique_sorted_desc(flush_ranks);

        var sf_high = __poker_straight_high(flush_ranks);
        if (sf_high > 0) {
            return {
                category: 8, // Straight Flush
                tiebreak: [8, sf_high]
            };
        }
    }

    // Four of a Kind?
    if (groups[0].count == 4) {
        var quad = groups[0].rank;
        var kicker = groups[1].rank;
        return {
            category: 7,
            tiebreak: [7, quad, kicker]
        };
    }

    // Full House?
    if (groups[0].count == 3 && groups[1].count == 2) {
        return {
            category: 6,
            tiebreak: [6, groups[0].rank, groups[1].rank]
        };
    }

    // Flush?
    if (is_flush) {
        // High cards of flush in desc order
        return {
            category: 5,
            tiebreak: [5, r[0], r[1], r[2], r[3], r[4]]
        };
    }

    // Straight?
    if (is_straight) {
        return {
            category: 4,
            tiebreak: [4, straight_high]
        };
    }

    // Three of a Kind?
    if (groups[0].count == 3) {
        // Kicker ranks from the next groups (desc)
        var kick1 = groups[1].rank;
        var kick2 = groups[2].rank;
        return {
            category: 3,
            tiebreak: [3, groups[0].rank, kick1, kick2]
        };
    }

    // Two Pair?
    if (groups[0].count == 2 && groups[1].count == 2) {
        var highPair = max(groups[0].rank, groups[1].rank);
        var lowPair  = min(groups[0].rank, groups[1].rank);
        var kicker2p = groups[2].rank;
        return {
            category: 2,
            tiebreak: [2, highPair, lowPair, kicker2p]
        };
    }

    // One Pair?
    if (groups[0].count == 2) {
        var pairRank = groups[0].rank;
        var k1 = groups[1].rank;
        var k2 = groups[2].rank;
        var k3 = groups[3].rank;
        return {
            category: 1,
            tiebreak: [1, pairRank, k1, k2, k3]
        };
    }

    // High Card
    return {
        category: 0,
        tiebreak: [0, r[0], r[1], r[2], r[3], r[4]]
    };
}

// ===== Helpers =====

/// replaces __poker_sort_desc
function __poker_sort_desc(arr) {
    // In GML, simple assignment clones arrays (value type).
    var a = arr; 
    var n = array_length(a);
    for (var i = 0; i < n; i++) {
        for (var j = i + 1; j < n; j++) {
            if (a[j] > a[i]) {
                var t = a[i]; a[i] = a[j]; a[j] = t;
            }
        }
    }
    return a;
}


function __poker_unique_sorted_desc(arr) {
    var sorted = __poker_sort_desc(arr);
    var out = [];
    var last = -1;
    for (var i = 0; i < array_length(sorted); i++) {
        var v = sorted[i];
        if (i == 0 || v != last) {
            array_push(out, v);
            last = v;
        }
    }
    return out;
}

/// replaces __poker_sort_groups
function __poker_sort_groups(groups) {
    // Clone by value, then sort by (count desc, rank desc)
    var g = groups; 
    var n = array_length(g);
    for (var i = 0; i < n; i++) {
        for (var j = i + 1; j < n; j++) {
            if ( (g[j].count > g[i].count) || (g[j].count == g[i].count && g[j].rank > g[i].rank) ) {
                var t = g[i]; g[i] = g[j]; g[j] = t;
            }
        }
    }
    return g;
}


function __poker_straight_high(sorted_desc_unique_ranks) {
    // Accepts array of ranks already sorted desc and unique.
    // Returns highest card of the straight, handles A-2-3-4-5 as 5.
    var u = __poker_unique_sorted_desc(sorted_desc_unique_ranks);

    // special wheel check: contains A and 5,4,3,2
    var hasA = __poker_array_has(u, 14);
    if (hasA && __poker_array_has(u,5) && __poker_array_has(u,4) && __poker_array_has(u,3) && __poker_array_has(u,2)) {
        return 5;
    }

    // slide window of consecutive 5
    // since it's a 5-card hand, u length is at most 5, but this also works for flush subset chk
    if (array_length(u) < 5) return 0;

    // for exact 5 unique ranks:
    var ok = true;
    for (var i = 0; i < 4; i++) {
        if (u[i] != u[i+1] + 1) { ok = false; break; }
    }
    return ok ? u[0] : 0;
}

function __poker_array_has(a, v) {
    for (var i = 0; i < array_length(a); i++) if (a[i] == v) return true;
    return false;
}

// Compare two tiebreak arrays lexicographically.
// Returns 1 if A>B, -1 if A<B, 0 if equal.
function __poker_compare(A, B) {
    var na = array_length(A), nb = array_length(B);
    var n = min(na, nb);
    for (var i = 0; i < n; i++) {
        if (A[i] > B[i]) return 1;
        if (A[i] < B[i]) return -1;
    }
    if (na > nb) return 1;
    if (na < nb) return -1;
    return 0;
}

function __poker_category_name(cat) {
    switch (cat) {
        case 8: return "Straight Flush";
        case 7: return "Four of a Kind";
        case 6: return "Full House";
        case 5: return "Flush";
        case 4: return "Straight";
        case 3: return "Three of a Kind";
        case 2: return "Two Pair";
        case 1: return "One Pair";
        default: return "High Card";
    }
}

function __poker_rank_name(r) {
    switch (r) {
        case 12: return "Ace";
        case 11: return "King";
        case 10: return "Queen";
        case 09: return "Jack";
        default: return string(r + 2);
    }
}

function __poker_plural(name, count) {
    return (count == 1) ? name : name + "s";
}

function __poker_build_label(cat, tb) {
    // tb starts with [cat, ...]
    switch (cat) {
        case 8: {
            var hi = tb[1];
            if (hi == 14) return "Royal Flush";
            return "Straight Flush, high " + __poker_rank_name(hi);
        }
        case 7: return "Four of a Kind, " + __poker_plural(__poker_rank_name(tb[1]), 4) + " with " + __poker_rank_name(tb[2]) + " kicker";
        case 6: return "Full House, " + __poker_plural(__poker_rank_name(tb[1]), 3) + " over " + __poker_plural(__poker_rank_name(tb[2]), 2);
        case 5: return "Flush, " + __poker_rank_name(tb[1]) + " high";
        case 4: return "Straight, high " + __poker_rank_name(tb[1]);
        case 3: return "Three of a Kind, " + __poker_plural(__poker_rank_name(tb[1]), 3);
        case 2: return "Two Pair, " + __poker_plural(__poker_rank_name(tb[1]), 2) + " and " + __poker_plural(__poker_rank_name(tb[2]), 2);
        case 1: return "One Pair, " + __poker_plural(__poker_rank_name(tb[1]), 2);
        default: return "High Card, " + __poker_rank_name(tb[1]);
    }
}

// Order best5 nicely for display (most relevant cards first)
// For scoring we already used tiebreakers; this just reorders the chosen 5 visually.
function __poker_order_best5(cat, tb, hand5) {
    // Make a copy so we can sort by rank freq then rank desc
    var counts = array_create(15, 0);
    for (var i = 0; i < 5; i++) counts[hand5[i].Rank]++;

    // Build sortable list [{card, count}]
    var L = [];
    for (var i = 0; i < 5; i++) array_push(L, { card: hand5[i], c: counts[hand5[i].Rank] });

    // sort by (count desc, rank desc)
    var n = array_length(L);
    for (var i = 0; i < n; i++) {
        for (var j = i + 1; j < n; j++) {
            var ai = L[i], aj = L[j];
            if ( (aj.c > ai.c) || (aj.c == ai.c && aj.card.Rank > ai.card.Rank) ) {
                var t = L[i]; L[i] = L[j]; L[j] = t;
            }
        }
    }

    // return cards only
    var out = [];
    for (var k = 0; k < n; k++) array_push(out, L[k].card);
    return out;
}

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
