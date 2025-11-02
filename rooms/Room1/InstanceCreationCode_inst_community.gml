Cards = [];
handType = "Community";
maxHand = 5;
best5 = [];
// Hand Create
Cards = [];           // will hold the two card *instances*
card_spacing = 100;    // pixels between the two cards
lerp_rate = 0.15;     // 0..1 (higher = faster)
target_y_offset = 0;  // tweak if you want the hand slightly above/below the Hand object's y
drawing = false;
handState = eFACESTATE.FACEDOWN;