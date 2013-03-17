//
//  NSManagedObjectContext+TMCDSaving.m
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#import "NSManagedObjectContext+TMCDSaving.h"

#import "TMCDLog.h"


@implementation NSManagedObjectContext (TMCDSaving)

- (BOOL)save
{
    __block BOOL result = YES;
    
    [self performBlockAndWait:^{
        NSError* error = nil;
        
        if (![self hasChanges])
            return;
        
        if (![self save:&error])
        {
            TMCDLog(@"save ERROR: %@", error);
            result = NO;
        }
    }];
    
    return result;
}

-(void)recursiveSave
{
    [self performBlockAndWait:^{
 
        if (![self hasChanges])
            return;

        NSError * error;
        if(![self save:&error])
        {
            //ERROR
            TMCDLog(@"recursiveSave ERROR: %@", error);
        }
        
        if(self.parentContext)
        {
            [self.parentContext recursiveSave];
        }
    }];
}

-(void)observeChangesFromParent:(BOOL)observe
{
    if(observe)
    {
        // This will pull down changes made into the primary context into our UI context.
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(contextDidSave:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:self.parentContext];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (void)contextDidSave:(NSNotification *)notification
{
    NSManagedObjectContext * notificationContext = notification.object;
    
    if(notificationContext == self)
    {
        // we dont need to run on ourselves
        return;
    }
    
    // only do this if the notification came from our direct parent please
    // we need this as if you have more than 1 TMCoreData instance it will
    // seriously mess up trying to import from another store!
    if( notification.object == self.parentContext )
    {
        [self performBlock:^{
            [self mergeChangesFromContextDidSaveNotification:notification];
        }];
    }
}


#pragma mark - Context iCloud Merge Helpers

-(void)mergeChangesFromiCloud:(NSNotification *)notification
{
    [self performBlock:^{
        
        TMCDLog(@"Merging changes From iCloud");
        
        [self mergeChangesFromContextDidSaveNotification:notification];
        
        /*
         [[NSNotificationCenter defaultCenter] postNotificationName:kMagicalRecordDidMergeChangesFromiCloudNotification
         object:self
         userInfo:[notification userInfo]];
         */
    }];
}

-(void)observeiCloudChangesInCoordinator:(NSPersistentStoreCoordinator *)coordinator
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mergeChangesFromiCloud:)
                                                 name:NSPersistentStoreDidImportUbiquitousContentChangesNotification
                                               object:coordinator];
    
}

-(void)stopObservingiCloudChangesInCoordinator:(NSPersistentStoreCoordinator *)coordinator
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSPersistentStoreDidImportUbiquitousContentChangesNotification
                                                  object:coordinator];
}

@end
