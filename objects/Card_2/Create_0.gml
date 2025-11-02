enum eSUIT { DIAMONDS, HEARTS, SPADES, CLUBS}
enum eRANK {  TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE,}
enum eFACESTATE { FACEDOWN, FACEUP}
suit_names = [
    "DIAMONDS",
	"HEARTS",
    "SPADES",
    "CLUBS"
];
rank_names = [
 "2", "3", "4", "5", "6", "7", "8", "9", "10", "JACK", "QUEEN", "KING" ,"ACE",
]

ShowBack = true;
Suit = eSUIT.DIAMONDS;
Rank = eRANK.ACE;

scale(90,129);
Init(eSUIT.DIAMONDS,eRANK.TWO);


function scale(xScale, yScale) {
	var spr_w = sprite_get_width(sprite_index);   // 242
	var spr_h = sprite_get_height(sprite_index);  // 348
	image_xscale = xScale  / spr_w;
	image_yscale = yScale / spr_h;
}

function Init(_suit, _rank) {
	Suit = _suit;
	Rank = _rank;
}


function FLIP() {
	if(ShowBack) {
		ShowBack = false; 
	} else {
		ShowBack = true;
	}
	if(ShowBack) {
		sprite_index = spr_card_back;
	} else {
		var spriteString = string_lower("spr_" + suit_names[Suit] + "_" + rank_names[Rank]);
		var spr = asset_get_index(spriteString);
		if (spr != -1) {
		    sprite_index = spr;
		} else {
		    show_debug_message("Sprite not found: " + spriteString);
		}
	}
}

function GetSprite() {
	if(ShowBack) {
		return spr_card_back;
	} else {
		var spriteString = "spr_" + suit_names[Suit] + "_" + rank_names[Rank];
		return asset_get_index(string_lower(spriteString));
	}
}

function ToString() {
	return rank_names[Rank] + " of " + suit_names[Suit]
}

function Highlight() {
}

