//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRBaseMediaAsset.h"

#import "BRSecureResource-Protocol.h"

@class NSMutableDictionary;

@interface BRXMLMediaAsset : BRBaseMediaAsset <BRSecureResource>
{
    NSMutableDictionary *_info;
}

- (id)artist;
- (id)assetID;
- (unsigned int)bookmarkTimeInMS;
- (unsigned int)bookmarkTimeInSeconds;
- (id)cast;
- (id)composer;
- (id)copyright;
- (id)coverArt;
- (id)coverArtID;
- (id)dateAcquired;
- (id)dateCreated;
- (id)datePublished;
- (void)dealloc;
- (id)description;
- (id)dictionary;
- (id)directors;
- (long)duration;
- (BOOL)forceHDCPProtection;
- (id)genres;
- (BOOL)hasCoverArt;
- (BOOL)hasVideoContent;
- (id)imageProxy;
- (id)init;
- (id)initWithMediaProvider:(id)arg1;
- (BOOL)isExplicit;
- (id)mediaSummary;
- (id)mediaType;
- (id)mediaURL;
- (id)merchant;
- (long)parentalControlRatingRank;
- (long)parentalControlRatingSystemID;
- (id)playbackMetadata;
- (id)previewURL;
- (id)primaryCollectionTitle;
- (id)primaryGenre;
- (id)publisher;
- (id)rating;
- (void)requiredScope:(unsigned int *)arg1 accountType:(id *)arg2;
- (id)resolution;
- (void)setDictionary:(id)arg1;
- (void)setObject:(id)arg1 forKey:(id)arg2;
- (id)thumbnailArt;
- (id)thumbnailArtID;
- (id)thumbnailURL;
- (id)title;
- (id)trickPlayConfig;
- (id)trickPlayURL;

@end

