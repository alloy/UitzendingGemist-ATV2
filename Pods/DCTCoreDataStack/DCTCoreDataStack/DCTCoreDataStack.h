/*
 DCTCoreDataStack.h
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "NSManagedObjectContext+DCTCoreDataStack.h"

#ifndef dctcoredatastack
#define dctcoredatastack_1_0     10000
#define dctcoredatastack         dctcoredatastack_1_0
#endif

// This can be added to the store options to exclude the store from backup
extern NSString *const DCTCoreDataStackExcludeFromBackupStoreOption;


/** DCTCoreDataStack is intended for non-document based apps, and sets up the whole Core Data structure such 
 that after initializing, the managedObjectContext property is ready for use.
 
 DCTCoreDataStack provides the following features:
 
 1. An encapsulation of the complete Core Data stack of NSManagedObjectContext, NSPersistentStoreCoordinator, NSPersistentStore, and NSManagedObjectModel
 2. On supporting OS's, writing to disk is performed on a background thread, by using a parent context. Saving the main context automatically triggers saving the parent context asynchronously
 3. [[NSManagedObjectContext dct_saveWithCompletionHandler:]](../Categories/NSManagedObjectContext%28DCTCoreDataStack%29.html#//api/name/dct_saveWithCompletionHandler:) method can be used to be notified when saving to disk finishes, asynchronously if possible
 4. Allows you to resolve errors when loading the persistent store by setting [didResolvePersistentStoreErrorHandler](#//api/name/didResolvePersistentStoreErrorHandler)
 5. On iOS, the app entering the background, or terminating, automatically triggers a save if needed. You can be notified of such saves by setting [automaticSaveCompletionHandler](#//api/name/automaticSaveCompletionHandler)
 6. On iOS, when saving on a background thread, the stack protects against termination/suspension by declaring the save as a background task
 8. Providing @YES for DCTCoreDataStackExcludeFromBackupStoreOption in the storeOptions will exclude the persistent store from being backed up
 
 */
@interface DCTCoreDataStack : NSObject

/// @name Initialization

/** Convience method to quickly set up a default stack and is generally the best method to use when getting started.
 
 This passes through the following options to the designated initializer:
 
 - storeURL: A URL of a file called filename in the app's documentsDirectory
 - storeType : NSSQLiteStoreType
 - storeOptions : nil
 - modelConfiguration : nil
 - modelURL : nil (so the model is made up by merging all the models in the application's main bundle)
 
 @param filename The name of the created persistent store file.
 @see -initWithStoreURL:storeType:storeOptions:modelConfiguration:modelURL:
 */
- (id)initWithStoreFilename:(NSString *)filename;

// This method is helpful for when your app has previously been using -initWithStoreFilename: but now needs to migrate an existing store. To do so, specify the name of the *new* model; set the options values corresponding to both the NSMigratePersistentStoresAutomaticallyOption and the NSInferMappingModelAutomaticallyOption keys to YES. For more details see Apple's Core Data versioning and migration guide.

/** The is designated initializer for the class and allows control over options given to the model and persistent store.
 
 For more detailed information about the storeType, storeOptions and modelConfiguration parameters, see the documentation for [NSPersistentStoreCoordinator](NSPersistentStoreCoordinator).
 
 @param storeURL The URL where the persistent store should be created.
 @param storeType The type for the store, can accept NSSQLiteStoreType, NSXMLStoreType, NSBinaryStoreType, NSInMemoryStoreType depending on the platform.
 @param storeOptions The options for the store, these are passed to the NSPersistentStoreCoordinator when adding a persistent store. DCTCoreDataStack also accepts its own options, including DCTCoreDataStackExcludeFromBackupStoreOption.
 @param modelConfiguration The model configuration to use, this is passed to the NSPersistentStoreCoordinator when adding a persistent store.
 @param modelURL The URL of the model. If this is nil, the model will be made up by merging all the models in the application's main bundle.
 */
- (id)initWithStoreURL:(NSURL *)storeURL
			 storeType:(NSString *)storeType
		  storeOptions:(NSDictionary *)storeOptions
	modelConfiguration:(NSString *)modelConfiguration
			  modelURL:(NSURL *)modelURL;

/// @name Working with the Stack

/** Provides a context for working on the main thread.
 
 This provides a context on the main thread, to connect with the UI. It has a parent context on a background thread,
 to perform quicker saves to disk. Saving this context causes the parent context to save, asyncronously if
 [NSManagedObjectContext dct_saveWithCompletionHandler:](../Categories/NSManagedObjectContext%28DCTCoreDataStack%29.html#//api/name/dct_saveWithCompletionHandler:) is used. */
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

/// @name Configuration State

/** The URL of the persistent store file. */
@property (nonatomic, copy, readonly) NSURL *storeURL;

/** The type of the persistent store. */
@property (nonatomic, copy, readonly) NSString *storeType;

/** The options given to the persistent store coordinator when adding the persistent store. */
@property (nonatomic, copy, readonly) NSDictionary *storeOptions;

/** The model configuration given to the persistent store coordinator when adding the persistent store. */
@property (nonatomic, copy, readonly) NSString *modelConfiguration;

/** The URL of the model being used. This can be nil if the model is merged from all the models in the app's main bundle. */
@property (nonatomic, copy, readonly) NSURL *modelURL;

/// @name Handling Events

/** An error may happen on loading the persistent store, due to an incompatible model for example.
 If you can resolve the error, either by migrating the store or deleting it and return YES from this
 block, DCTCoreDataStack will attempt to load the persistent store again.
 
 This is only called once. */
@property (nonatomic, copy) BOOL (^didResolvePersistentStoreErrorHandler)(NSError *error);

#if TARGET_OS_IPHONE
/** This block is called on iOS on completion or failure of a save caused due to the app entering the background or getting a termination notification. */
@property (nonatomic, copy) void(^automaticSaveCompletionHandler)(BOOL success, NSError *error);
#endif

@end
