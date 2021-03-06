//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

@class NSAttributedString;

@interface BRTextControl : BRControl
{
    NSAttributedString *_string;
}

- (void)_shrinkTextToFitInBounds:(struct CGSize)arg1;
- (void)_shrinkTextToTwoLines:(struct CGSize)arg1;
- (id)accessibilityLabel;
- (id)attributedString;
- (void)dealloc;
- (void)drawInContext:(struct CGContext *)arg1;
- (id)init;
- (BOOL)isAccessibilityElement;
- (struct CGSize)renderedSize;
- (struct CGSize)renderedSizeWithMaxSize:(struct CGSize)arg1;
- (void)setAttributedString:(id)arg1;
- (void)setMaxSize:(struct CGSize)arg1;
- (void)setText:(id)arg1 withAttributes:(id)arg2;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;
- (void)updateBoundValue;

@end

