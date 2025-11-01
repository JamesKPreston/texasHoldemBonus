enum eSUIT { DIAMONDS, HEARTS, SPADES, CLUBS}
enum eFACE { ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING}
enum eFACESTATE { FACEDOWN, FACEUP}
suit_names = [
    "DIAMONDS",
	"HEARTS",
    "SPADES",
    "CLUBS"
];
face_names = [
"ACE", "2", "3", "4", "5", "6", "7", "8", "9", "10", "JACK", "QUEEN", "KING"
]

ShowBack = true;
Suit = eSUIT.DIAMONDS;
Face = eFACE.ACE;

scale(90,129);
Init(eSUIT.DIAMONDS,eFACE.SIX);


function scale(xScale, yScale) {
	var spr_w = sprite_get_width(sprite_index);   // 242
	var spr_h = sprite_get_height(sprite_index);  // 348
	image_xscale = xScale  / spr_w;
	image_yscale = yScale / spr_h;
}

function Init(_suit, _face) {
	Suit = _suit;
	Face = _face;
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
		var spriteString = "spr_" + suit_names[Suit] + "_" + face_names[Face];
		var spr = asset_get_index(string_lower(spriteString));
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
		var spriteString = "spr_" + suit_names[Suit] + "_" + face_names[Face];
		return asset_get_index(string_lower(spriteString));
	}
}

function ToString() {
	return face_names[Face] + " of " + suit_names[Suit]
}

function Highlight() {
}

