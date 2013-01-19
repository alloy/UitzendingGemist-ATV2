//
//  BRStringDrawing.h
//  cocos2d-ios
//
//  Created by Michael Gile on 9/1/11.
//  Copyright 2011 Michael Gile All rights reserved.
//

typedef enum {		
    BRLineBreakModeWordWrap = 0,            // Wrap at word boundaries
    BRLineBreakModeCharacterWrap,           // Wrap at character boundaries
    BRLineBreakModeClip,                    // Simply clip when it hits the end of the rect
    BRLineBreakModeHeadTruncation,          // Truncate at head of line: "...wxyz". Will truncate multiline text on first line
    BRLineBreakModeTailTruncation,          // Truncate at tail of line: "abcd...". Will truncate multiline text on last line
    BRLineBreakModeMiddleTruncation,        // Truncate middle of line:  "ab...yz". Will truncate multiline text in the middle
} BRLineBreakMode;

typedef enum {
    BRTextAlignmentLeft = 0,
    BRTextAlignmentCenter,
    BRTextAlignmentRight,                   // could add justified in future
} BRTextAlignment;

typedef enum {
    BRBaselineAdjustmentAlignBaselines = 0, // default. used when shrinking text to position based on the original baseline
    BRBaselineAdjustmentAlignCenters,
    BRBaselineAdjustmentNone,
} BRBaselineAdjustment;
