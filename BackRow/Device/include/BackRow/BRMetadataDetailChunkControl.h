//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRControl.h"

#import "BRMetadataContainer.h"

__attribute__((visibility("hidden")))
@interface BRMetadataDetailChunkControl : BRControl <BRMetadataContainer>
{
    BOOL _leftAlignLabel;
}

- (id)accessibilityLabel;
- (void)dealloc;
- (void)layoutSubcontrols;
@property(nonatomic) BOOL leftAlignLabel; // @synthesize leftAlignLabel=_leftAlignLabel;
- (void)setMetadata:(id)arg1 withLabels:(id)arg2;
- (struct CGSize)sizeThatFits:(struct CGSize)arg1;

@end

