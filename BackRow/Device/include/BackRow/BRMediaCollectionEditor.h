//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//



@interface BRMediaCollectionEditor : NSObject
{
    id <BRMediaCollection> _collection;
}

+ (id)editorForCollection:(id)arg1;
+ (void)setImplementationClass:(Class)arg1;
- (void)addMediaObjectToCollection:(id)arg1;
- (void)clearCollection;
- (id)collection;
- (id)collectionCopyWithName:(id)arg1;
- (void)dealloc;
- (id)initWithMediaCollection:(id)arg1;
- (void)removeMediaObjectFromCollection:(id)arg1;

@end

