//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



#import "BRControlFactory-Protocol.h"
#import "BRControlHeightFactory-Protocol.h"

@class BRMediaType, NSSet;

__attribute__((visibility("hidden")))
@interface BRPlaylistsControlFactory : NSObject <BRControlFactory, BRControlHeightFactory>
{
    BOOL _showMetadata;
    BRMediaType *_missingType;
    NSSet *_mediaTypes;
    BOOL _useMultilineItems;
    BOOL _showIconForVideo;
    BOOL _resolveArtworkFromParent;
}

+ (id)factoryWithMissingType:(id)arg1 mediaTypes:(id)arg2 showMetadata:(BOOL)arg3;
+ (id)factoryWithMissingType:(id)arg1 mediaTypes:(id)arg2 showMetadata:(BOOL)arg3 resolveArtworkFromParentCollections:(BOOL)arg4;
- (BOOL)_showUnplayedIconForAsset:(id)arg1;
- (id)controlForData:(id)arg1 currentControl:(id)arg2 requestedBy:(id)arg3;
- (void)dealloc;
- (float)heightForControlForData:(id)arg1 requestedBy:(id)arg2;
- (id)initWithMissingType:(id)arg1 mediaTypes:(id)arg2 showMetadata:(BOOL)arg3;
- (id)initWithMissingType:(id)arg1 mediaTypes:(id)arg2 showMetadata:(BOOL)arg3 resolveArtworkFromParentCollections:(BOOL)arg4;
- (id)mediaTypes;
- (void)setShouldUseMultilineItems:(BOOL)arg1;
- (void)setShowIconForVideo:(BOOL)arg1;
- (BOOL)shouldUseMultilineItems;
- (BOOL)showIconForVideo;

@end

