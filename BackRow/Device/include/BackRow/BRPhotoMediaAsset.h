//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRBaseMediaAsset.h"

@class BRImageManager, NSString;

@interface BRPhotoMediaAsset : BRBaseMediaAsset
{
    NSString *_thumbURL;
    NSString *_coverArtURL;
    NSString *_fullURL;
    NSString *_artID;
    double _dateTakenTimerInterval;
    BOOL _isLocal;
    NSString *_title;
}

- (id)artID;
- (id)assetID;
- (id)coverArt;
- (id)coverArtID;
- (id)coverArtURL;
- (id)dateTaken;
- (void)dealloc;
- (struct CGRect)faceRectForFaceCollectionID:(id)arg1;
- (id)faces;
- (id)fullSizeArt;
- (id)fullSizeArtID;
- (id)fullURL;
- (unsigned int)hash;
- (id)imageProxy;
- (id)init;
- (BOOL)isEqual:(id)arg1;
- (BOOL)isLocal;
- (id)mediaType;
@property(readonly) BRImageManager *preferredImageManager;
- (id)primaryCollection;
- (void)setArtID:(id)arg1;
- (void)setCoverArtURL:(id)arg1;
- (void)setDateTaken:(id)arg1;
- (void)setFullURL:(id)arg1;
- (void)setIsLocal:(BOOL)arg1;
- (void)setThumbURL:(id)arg1;
- (void)setTitle:(id)arg1;
- (id)subImageProxyWithRect:(struct CGRect)arg1;
- (id)thumbURL;
- (id)thumbnailArt;
- (id)thumbnailArtID;
- (id)title;

@end

