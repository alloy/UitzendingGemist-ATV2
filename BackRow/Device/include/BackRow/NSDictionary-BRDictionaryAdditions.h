//
//     Generated by class-dump 3.4 (64 bit) (Debug version compiled Mar  6 2013 16:24:16).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2012 by Steve Nygard.
//

@interface NSDictionary (BRDictionaryAdditions)
+ (id)dictionaryOfLocalizedRUIData;
+ (id)dictionaryWithContentsOfURL:(id)arg1 withHeaderDictionary:(id)arg2;
+ (id)dictionaryWithContentsOfURL:(id)arg1 withHeaderDictionary:(id)arg2 cachePolicy:(unsigned int)arg3;
- (id)URLQueryString;
- (id)URLQueryStringWithKeyOrder:(id)arg1;
- (void)__purgeCachedLocalizedData:(id)arg1;
- (id)deepCopy;
- (id)deepMutableCopy;
- (BOOL)writeToFile:(id)arg1 atomically:(BOOL)arg2 format:(unsigned int)arg3;
@end
