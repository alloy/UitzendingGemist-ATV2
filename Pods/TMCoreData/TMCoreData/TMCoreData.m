//
//  TMCoreData.m
//  TMCoreData
//
//  Created by Tony Million on 02/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "TMCoreData.h"

#import "TMCDLog.h"


#define IOS_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define IOS_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define IOS_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


NSString *const kTMCoreDataiCloudIsAvailableNotification = @"kTMCoreDataiCloudIsAvailableNotification";


@interface TMCoreData ()

@property(copy) NSString    *dataStoreName;
@property(strong, nonatomic) NSManagedObjectModel          *objectModel;
@property(strong, nonatomic) NSPersistentStoreCoordinator  *persistentStoreCoordinator;

@end

//TODO: make a variable to see wether iCloud is actually online or if we're using a local version because user doesn't have iCloud

@implementation TMCoreData

@synthesize primaryContext              = _primaryContext;
@synthesize mainThreadContext           = _mainThreadContext;

-(id)init
{
    //TODO: replace this with app name!
    NSString * name = [NSString stringWithFormat:@"%@.sqlite", [[NSBundle mainBundle] bundleIdentifier]];
    return [self initWithLocalStoreNamed:name];
}

-(id)initWithLocalStoreNamed:(NSString*)localStore
{
    return [self initWithLocalStoreNamed:localStore
                             objectModel:nil];
}

-(id)initWithLocalStoreNamed:(NSString*)localStore objectModel:(NSManagedObjectModel*)objectModel
{
    self = [super init];
    if(self)
    {
        self.dataStoreName = localStore;
        
        if(objectModel)
        {
            _objectModel = objectModel;
        }
        else
        {
            _objectModel = [self objectModelFromAppBundle];
        }
        
        // Define the Core Data version migration options
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES,
                                  NSInferMappingModelAutomaticallyOption: @YES};
        
        // Attempt to load the persistent store
        NSError *error = nil;
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_objectModel];
        
    tryagain:
        if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                      configuration:nil
                                                                URL:[self persistentStoreURL]
                                                            options:options
                                                              error:&error])
        {
            TMCDLog(@"Fatal error while creating persistent store: %@", error);
            /*
            if ([error.domain isEqualToString:NSCocoaErrorDomain] && [error code] == NSMigrationMissingSourceModelError)
            {
                // Could not open the database, so... kill it!
                [[NSFileManager defaultManager] removeItemAtURL:[self persistentStoreURL]
                                                          error:nil];
                
                goto tryagain;
            }
             */
            abort();
        }
        
        _primaryContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_primaryContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        [_primaryContext setUndoManager:nil];
        
        _mainThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_mainThreadContext setParentContext:self.primaryContext];
        [_mainThreadContext observeChangesFromParent:YES];
    }
    
    return self;
}

-(id)initWithiCloudContainer:(NSString *)iCloudEnabledAppID localStoreNamed:(NSString *)localStore objectModel:(NSManagedObjectModel*)objectModel icloudActiveBlock:(void(^)(void))iCloudActiveBlock
{
    self = [super init];
    if(self)
    {
        self.dataStoreName = localStore;
        
        if(objectModel)
        {
            _objectModel = objectModel;
        }
        else
        {
            _objectModel = [self objectModelFromAppBundle];
        }
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_objectModel];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSFileManager *fileManager = [[NSFileManager alloc] init];
            
            NSURL *ubiquityContainer = [fileManager URLForUbiquityContainerIdentifier:nil];
            
            if(ubiquityContainer)
            {
                NSURL *iCloudLogsPath = [NSURL fileURLWithPath:[[ubiquityContainer path] stringByAppendingPathComponent:@"Logs"]];
                
                TMCDLog(@"ubiquityContainer = %@", ubiquityContainer);
                TMCDLog(@"iCloudEnabledAppID = %@",iCloudEnabledAppID);
                TMCDLog(@"iCloudLogsPath = %@", iCloudLogsPath);
                
                NSMutableDictionary *options = [NSMutableDictionary dictionary];
                [options setObject:[NSNumber numberWithBool:YES] forKey:NSMigratePersistentStoresAutomaticallyOption];
                [options setObject:[NSNumber numberWithBool:YES] forKey:NSInferMappingModelAutomaticallyOption];
                [options setObject:iCloudEnabledAppID            forKey:NSPersistentStoreUbiquitousContentNameKey];
                [options setObject:iCloudLogsPath                forKey:NSPersistentStoreUbiquitousContentURLKey];
                
                [_persistentStoreCoordinator lock];
                NSError * error;
                if(![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                              configuration:nil
                                                                        URL:[self persistentStoreURL]
                                                                    options:options
                                                                      error:&error])
                {
                    TMCDLog(@"iCloud addPersistentStoreWithType FAILED: %@", error);
                    abort();
                }
                
                [_persistentStoreCoordinator unlock];
                
                if(iCloudActiveBlock)
                {
                    // we call this SYNCHRONOUSLY on the main queue, before dispatching the notification
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        iCloudActiveBlock();
                    });
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:kTMCoreDataiCloudIsAvailableNotification
                                                                        object:self];
                });
            }
            else
            {
                TMCDLog(@"iCloud is INACTIVE");
                
                if([[self persistentStoreURL] checkResourceIsReachableAndReturnError:nil] == YES) {
                    
                    [fileManager removeItemAtURL:[self persistentStoreURL]
                                           error:nil];
                    
                }
                
                
                NSMutableDictionary *options = [NSMutableDictionary dictionary];
                [options setObject:[NSNumber numberWithBool:YES] forKey:NSMigratePersistentStoresAutomaticallyOption];
                [options setObject:[NSNumber numberWithBool:YES] forKey:NSInferMappingModelAutomaticallyOption];
                
                [_persistentStoreCoordinator lock];
                
                [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                          configuration:nil
                                                                    URL:[self persistentStoreURL]
                                                                options:options
                                                                  error:nil];
                
                [_persistentStoreCoordinator unlock];
                
                if(iCloudActiveBlock)
                {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        iCloudActiveBlock();
                    });
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:kTMCoreDataiCloudIsAvailableNotification
                                                                        object:self];
                });

            }
            
            
            TMCDLog(@"Creating Primary Context");
            _primaryContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [_primaryContext performBlockAndWait:^{
                [_primaryContext setPersistentStoreCoordinator:_persistentStoreCoordinator];
                [_primaryContext observeiCloudChangesInCoordinator:_persistentStoreCoordinator];
                [_primaryContext setUndoManager:nil];
                
                _mainThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
                [_mainThreadContext setParentContext:self.primaryContext];
                [_mainThreadContext observeChangesFromParent:YES];
            }];
            TMCDLog(@"Primary Context = %@", _primaryContext);
            
        });
    }
    return self;
}

-(NSManagedObjectModel*)objectModelFromAppBundle
{
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    });
    
	return _objectModel;
}


#pragma mark - context getting stuff

-(NSManagedObjectContext*)mainThreadContext
{
    return _mainThreadContext;
}

-(NSManagedObjectContext*)scratchContext
{
    NSManagedObjectContext * parentContext = [self mainThreadContext];
    if(!parentContext)
        return nil;
    
    NSManagedObjectContext * tempContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [tempContext setParentContext:parentContext];
    
    return tempContext;
}


#pragma mark - Helper stuff
// Returns the URL to the application's Documents directory.
-(NSURL *)applicationLibraryDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}

-(NSURL*)persistentStoreURL
{
    return [[self applicationLibraryDirectory] URLByAppendingPathComponent:self.dataStoreName];
}

#pragma mark - main thread operation and save

-(void)saveOnMainThreadWithBlock:(void(^)(NSManagedObjectContext *localContext))block
{
    [self saveOnMainThreadWithBlock:block
                         completion:nil];
}

-(void)saveOnMainThreadWithBlock:(void(^)(NSManagedObjectContext *localContext))block completion:(void(^)(void))completion
{
    [_mainThreadContext performBlock:^{
        
        block(_mainThreadContext);
        
        [_mainThreadContext recursiveSave];
        
        if(completion)
        {
            dispatch_async(dispatch_get_main_queue(), completion);
        }
    }];
}


#pragma mark - background operation and save

-(void)saveInBackgroundWithBlock:(void(^)(NSManagedObjectContext *localContext))block
{
    [self saveInBackgroundWithBlock:block
                         completion:nil];
}

-(void)saveInBackgroundWithBlock:(void(^)(NSManagedObjectContext *localContext))block completion:(void(^)(void))completion
{
    NSManagedObjectContext       *backgroundSaveContext = [self scratchContext];
    [backgroundSaveContext performBlock:^{
        
        block(backgroundSaveContext);
        
        [backgroundSaveContext recursiveSave];
        
        if(completion)
        {
            dispatch_async(dispatch_get_main_queue(), completion);
        }
    }];
}


#pragma mark - persistent store coordinator stuff


-(void)resetPersistentStore
{
	NSError *error = nil;
    
    if(!_persistentStoreCoordinator)
    {
        TMCDLog(@"NO PERSISTENT STORE ACTIVE - JUST DELETING FILE!!");
        NSError * fileError;
        
		if(![[NSFileManager defaultManager] removeItemAtURL:[self persistentStoreURL]
													  error:&fileError])
		{
			TMCDLog(@"ERROR DELETING STORE: %@", fileError);
		}
        
        return;
    }
    
    [_mainThreadContext performBlockAndWait:^{
        [_mainThreadContext reset];
    }];
    
    [_primaryContext performBlockAndWait:^{
        [_primaryContext reset];
    }];
    
	for (NSPersistentStore *store in [_persistentStoreCoordinator persistentStores])
	{
		if (![_persistentStoreCoordinator removePersistentStore:store
														  error:&error])
		{
			TMCDLog(@"removePersistentStore error %@, %@", error, [error userInfo]);
		}
        
		TMCDLog(@"Deleting: %@", store.URL.absoluteString);
        
		if (![[NSFileManager defaultManager] removeItemAtURL:store.URL
													   error:&error])
		{
			TMCDLog(@" %@, %@", error, [error userInfo]);
		}
	}
    
    // Define the Core Data version migration options
	NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption: @YES};
    
readdagain:
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
												   configuration:nil
															 URL:[self persistentStoreURL]
														 options:options
														   error:&error])
	{
		TMCDLog(@"addPersistentStoreWithType (%@) error %@, %@",[self persistentStoreURL], error, [error userInfo]);
        
        NSError * fileError;
        
		if(![[NSFileManager defaultManager] removeItemAtURL:[self persistentStoreURL]
													  error:&fileError])
		{
			TMCDLog(@"ERROR DELETING STORE: %@", fileError);
		}
        else
        {
            goto readdagain;
        }
    }
    
    
    [_mainThreadContext performBlockAndWait:^{
        [_mainThreadContext reset];
    }];
    
    [_primaryContext performBlockAndWait:^{
        [_primaryContext reset];
    }];
}


@end

