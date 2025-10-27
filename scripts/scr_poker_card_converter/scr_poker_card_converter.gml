function scr_card_struct_from_index(idx) {
    if (idx <= 0 || idx > 52) return undefined;
    var zero_based = idx - 1;
    var suit = floor(zero_based / 13);      // 0..3
    var rank = (zero_based mod 13) + 1;     // 1..13 → map Ace=14 later if needed
    if (rank == 1) rank = 14;               // make Ace high
    return { rank: rank, suit: suit, id: idx };
}


/// scr_card_name_from_index(index)
/// Converts a sprite_array index (1–52) into a readable string like "Jack of Clubs"
function scr_card_name_from_index(idx) {
    if (idx <= 0 || idx > 52) return "Card Back";

    // Suits in order of your sprite_array
    var suits = ["Clubs", "Diamonds", "Hearts", "Spades"];
    // Ranks in order Ace..King
    var ranks = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"];

    // Subtract 1 because index 1 = first card (Ace of Clubs)
    var zero_based = idx - 1;
    var suit_index = floor(zero_based / 13);
    var rank_index = zero_based mod 13;

    return ranks[rank_index] + " of " + suits[suit_index];
}
