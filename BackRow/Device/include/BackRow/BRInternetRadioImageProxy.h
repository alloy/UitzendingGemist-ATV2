//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "NSObject.h"

#import "BRImageProxy.h"

@class NSString;

@interface BRInternetRadioImageProxy : NSObject <BRImageProxy>
{
    NSString *_category;
}

- (void)cancelImageRequestsForImageSizes:(int)arg1;
- (void)dealloc;
- (id)defaultImageForImageSize:(int)arg1;
- (id)imageForImageSize:(int)arg1;
- (id)imageIDForImageSize:(int)arg1;
- (id)initWithCategory:(id)arg1;
- (id)object;
- (BOOL)supportsImageForImageSize:(int)arg1;

@end

