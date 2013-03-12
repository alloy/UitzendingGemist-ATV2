//
//  _DCTCDSManagedObjectContext.m
//  DCTCoreDataStack
//
//  Created by Daniel Tull on 24.07.2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "_DCTCDSManagedObjectContext.h"
#import "NSManagedObjectContext+DCTCoreDataStack.h"
#import <objc/runtime.h>
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

@implementation _DCTCDSManagedObjectContext

- (BOOL)save:(NSError **)error {
		
	id object = objc_getAssociatedObject(self, @selector(dct_saveWithCompletionHandler:));
	
	if (object) return [super save:error];
	
	__block BOOL success = [super save:error];
	
	if (success) {
		
		NSManagedObjectContext *parent = self.parentContext;
		
		[parent performBlockAndWait:^{
			success = [parent save:error];
		}];
	}
	
	return success;
}

- (void)dct_saveWithCompletionHandler:(void(^)(BOOL success, NSError *error))completion {
	
#if TARGET_OS_IPHONE
	
	UIBackgroundTaskIdentifier backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:NULL];
	
	void(^iphoneCompletion)(BOOL, NSError *) = ^(BOOL success, NSError *error) {
		
		if (completion != NULL)
			completion(success, error);
		
		[[UIApplication sharedApplication] endBackgroundTask:backgroundTaskIdentifier];
	};
	
	completion = iphoneCompletion;
	
#endif
	
	NSManagedObjectContext *parent = self.parentContext;
	
	// Put anything in this association to switch on save:
	objc_setAssociatedObject(self, _cmd, [NSNull null], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	
	[super dct_saveWithCompletionHandler:^(BOOL success, NSError *error) {
		
		// Clear the association after the save
		objc_setAssociatedObject(self, _cmd, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		
		if (!success) {
			if (completion != NULL)
				completion(success, error);
			
			return;
		}
		
		[parent performBlock:^{
			[parent dct_saveWithCompletionHandler:completion];
		}];
	}];
}

@end
