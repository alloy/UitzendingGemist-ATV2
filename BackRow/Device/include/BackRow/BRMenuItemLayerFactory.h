//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

#import "BRSingleton.h"

@class NSArray;

@interface BRMenuItemLayerFactory : BRSingleton
{
    NSArray *_populators;
}

+ (void)setSingleton:(id)arg1;
+ (id)singleton;
- (id)_populatorForObject:(id)arg1;
- (void)dealloc;
- (id)init;
- (id)menuItemForObject:(id)arg1;
- (id)menuItemForObject:(id)arg1 delegate:(id)arg2;
- (float)menuItemHeightForObject:(id)arg1;
- (float)menuItemHeightForObject:(id)arg1 delegate:(id)arg2;
- (void)registerPopulator:(Class)arg1;
- (id)titleForObject:(id)arg1;
- (id)titleForObject:(id)arg1 delegate:(id)arg2;

@end

