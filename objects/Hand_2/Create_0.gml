Cards = [];
handType = "Dealer";
maxHand = 2;
best5 = [];
// Hand Create
Cards = [];           // will hold the two card *instances*
card_spacing = 40;    // pixels between the two cards
lerp_rate = 0.15;     // 0..1 (higher = faster)
target_y_offset = 0;  // tweak if you want the hand slightly above/below the Hand object's y
drawing = false;
handState = eFACESTATE.FACEDOWN;

enum eStage { HOLE = 0, FLOP = 1 , TURN = 2, RIVER = 3, SHOWDOWN = 4};
stage = eStage.HOLE;