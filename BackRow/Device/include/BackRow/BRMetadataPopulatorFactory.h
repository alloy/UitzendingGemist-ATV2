/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/AppleTV.framework/AppleTV
 */

#import "BRSingleton.h"

@protocol BRMetadataPopulator, BRMediaImagePopulator;

@interface BRMetadataPopulatorFactory : BRSingleton {
@private
	id<BRMediaImagePopulator> _imagePopulatorForStoreDictionary;	// 4 = 0x4
	id<BRMetadataPopulator> _tvShowPopulator;	// 8 = 0x8
	id<BRMetadataPopulator> _podcastPopulator;	// 12 = 0xc
	id<BRMetadataPopulator> _musicVideoPopulator;	// 16 = 0x10
	id<BRMetadataPopulator> _songPopulator;	// 20 = 0x14
	id<BRMetadataPopulator> _moviePopulator;	// 24 = 0x18
	id<BRMetadataPopulator> _movieTrailerPopulator;	// 28 = 0x1c
	id<BRMetadataPopulator> _rssPopulator;	// 32 = 0x20
	id<BRMetadataPopulator> _audiobookPopulator;	// 36 = 0x24
	id<BRMetadataPopulator> _musicAlbumPopulator;	// 40 = 0x28
	id<BRMetadataPopulator> _ytPopulator;	// 44 = 0x2c
	id<BRMetadataPopulator> _airTunesPopulator;	// 48 = 0x30
	id<BRMetadataPopulator> _radioPopulator;	// 52 = 0x34
}
+ (void)setSingleton:(id)singleton;	// 0x36712411
+ (id)singleton;	// 0x36712401
- (id)_populatorForMediaAsset:(id)mediaAsset;	// 0x367125cd
- (id)_populatorForMediaCollection:(id)mediaCollection;	// 0x36712ba9
- (void)dealloc;	// 0x36712421
- (id)populatorForAsset:(id)asset;	// 0x3671255d
@end

