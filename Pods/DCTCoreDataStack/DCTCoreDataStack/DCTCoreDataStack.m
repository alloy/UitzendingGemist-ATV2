/*
 DCTCoreDataStack.m
 DCTCoreDataStack
 
 Created by Daniel Tull on 01.12.2011.
 
 
 
 Copyright (c) 2011 Daniel Tull. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "DCTCoreDataStack.h"
#import "_DCTCDSManagedObjectContext.h"
#import <objc/runtime.h>
#include <sys/xattr.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

NSString *const DCTCoreDataStackExcludeFromBackupStoreOption = @"DCTCoreDataStackExcludeFromBackupStoreOption";

@interface DCTCoreDataStack ()
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *rootContext;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end

@implementation DCTCoreDataStack

#pragma mark - NSObject

#if TARGET_OS_IPHONE

- (void)dealloc {
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	UIApplication *app = [UIApplication sharedApplication];
	[defaultCenter removeObserver:self
							 name:UIApplicationDidEnterBackgroundNotification
						   object:app];
	[defaultCenter removeObserver:self
							 name:UIApplicationWillTerminateNotification
						   object:app];
}

#endif

#pragma mark - Initialization

- (id)initWithStoreURL:(NSURL *)storeURL
			 storeType:(NSString *)storeType
		  storeOptions:(NSDictionary *)storeOptions
	modelConfiguration:(NSString *)modelConfiguration
			  modelURL:(NSURL *)modelURL {
	
	NSParameterAssert(storeType);
	
	if (!(self = [self init])) return nil;
	
	_storeURL = [storeURL copy];
	_storeType = [storeType copy];
	_storeOptions = [storeOptions copy];
	_modelURL = [modelURL copy];
	_modelConfiguration = [modelConfiguration copy];
	
	self.didResolvePersistentStoreErrorHandler = ^(NSError *error) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
		return NO;
	};
	
#if TARGET_OS_IPHONE
	
	UIApplication *app = [UIApplication sharedApplication];
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	
	[defaultCenter addObserver:self
					  selector:@selector(_applicationDidEnterBackgroundNotification:)
						  name:UIApplicationDidEnterBackgroundNotification
						object:app];
	
	[defaultCenter addObserver:self
					  selector:@selector(_applicationWillTerminateNotification:)
						  name:UIApplicationWillTerminateNotification
						object:app];

#endif
	
	return self;
}

- (id)initWithStoreFilename:(NSString *)filename {
	NSURL *storeURL = [[[self class] _applicationDocumentsDirectory] URLByAppendingPathComponent:filename];
	return [self initWithStoreURL:storeURL
						storeType:NSSQLiteStoreType
					 storeOptions:nil
			   modelConfiguration:nil
						 modelURL:nil];
}

#pragma mark - Getters

- (NSManagedObjectContext *)managedObjectContext {
    
	if (_managedObjectContext == nil) {
		_managedObjectContext = [[_DCTCDSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
		[_managedObjectContext setParentContext:self.rootContext];
		_managedObjectContext.dct_name = @"DCTCoreDataStack.mainContext";
	}
	
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
	
	if (_managedObjectModel == nil)
		[self _loadManagedObjectModel];
	
	return _managedObjectModel;
}

#pragma mark - Internal Loading

- (NSManagedObjectContext *)rootContext {
	
	if (!_rootContext) {
		_rootContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
		[_rootContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
		_rootContext.dct_name = @"DCTCoreDataStack.internal_rootContext";
	}
	
	return _rootContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	
	if (_persistentStoreCoordinator == nil)
		[self _loadPersistentStoreCoordinator];
	
	return _persistentStoreCoordinator;
}

- (void)_loadManagedObjectModel {
	
    if (self.modelURL)
		_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
    else
		_managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
}

- (void)_loadPersistentStoreCoordinator {
	
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
	
	NSError *error = nil;
	NSPersistentStore *persistentStore = [_persistentStoreCoordinator addPersistentStoreWithType:self.storeType
																				   configuration:self.modelConfiguration
																							 URL:self.storeURL
																						 options:self.storeOptions
																						   error:&error];
	
	if (!persistentStore && self.didResolvePersistentStoreErrorHandler) {
		
		if (self.didResolvePersistentStoreErrorHandler(error))
			[_persistentStoreCoordinator addPersistentStoreWithType:self.storeType
													  configuration:self.modelConfiguration
																URL:self.storeURL
															options:self.storeOptions
															  error:NULL];
	}
	
	[self _setupExcludeFromBackupFlag];
}

#pragma mark - Other Internal

- (void)_setupExcludeFromBackupFlag {

	BOOL storeIsReachable = [self.storeURL checkResourceIsReachableAndReturnError:NULL];
	if (!storeIsReachable) return;

	const char *filePath = [[self.storeURL path] fileSystemRepresentation];
	const char *attrName = "com.apple.MobileBackup";

	void (^removeAttribute)() = ^{
		// Remove attribute if it exists
		int result = getxattr(filePath, attrName, NULL, sizeof(u_int8_t), 0, 0);
		if (result != -1) removexattr(filePath, attrName, 0);
	};
	
	void (^addAttribute)() = ^{
		u_int8_t attrValue = 1;
		setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
	};
	
	BOOL excludeFromBackup = [[self.storeOptions objectForKey:DCTCoreDataStackExcludeFromBackupStoreOption] boolValue];
	
	if (&NSURLIsExcludedFromBackupKey == NULL) { // iOS 5.0.x / 10.7.x or earlier

		if (excludeFromBackup)
			addAttribute();
		else
			removeAttribute();
		
	} else { // iOS 5.1 / OS X 10.8 and above

		// Remove attribute if it exists from an upgrade of an older version of iOS
		removeAttribute();

		[self.storeURL setResourceValue:@(excludeFromBackup) forKey:NSURLIsExcludedFromBackupKey error:NULL];
	}
}

+ (NSURL *)_applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#if TARGET_OS_IPHONE

- (void)_applicationDidEnterBackgroundNotification:(NSNotification *)notification {
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	if (![context hasChanges]) return;
	    
	[context performBlock:^{
		[context dct_saveWithCompletionHandler:self.automaticSaveCompletionHandler];
	}];
	
	// TODO: what if there was a save error?
}

- (void)_applicationWillTerminateNotification:(NSNotification *)notification {
	
	NSManagedObjectContext *context = self.managedObjectContext;
	
	if (![context hasChanges]) return;
	
	__block BOOL success = NO;
	__block NSError *error = nil;
	
	[context performBlock:^{
		success = [context save:&error];
	}];
	
	if (self.automaticSaveCompletionHandler != NULL)
		self.automaticSaveCompletionHandler(success, error);
}

#endif

@end
