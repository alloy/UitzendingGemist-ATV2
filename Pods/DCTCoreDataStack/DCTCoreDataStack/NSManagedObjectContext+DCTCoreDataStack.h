/*
 NSManagedObjectContext+DCTCoreDataStack.h
 DCTCoreDataStack
 
 Created by Daniel Tull on 03.12.2011.
 
 
 
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

#import <CoreData/CoreData.h>


/** Conviniences for the context, which also enable the asyncronous saving behavior in DCTCoreDataStack. */
@interface NSManagedObjectContext (DCTCoreDataStack)

/// @name Saving

/** Calls dct_saveWithCompletionHandler: with no handler. */
- (void)dct_save;

/** Will perform the save and call the given completionHandler when complete, either with success or failure.
 
 There is no garantee to the queue that the completionHandler will be called on.
 
 @param completionHandler The handler to call once a save has completed.*/
- (void)dct_saveWithCompletionHandler:(void(^)(BOOL success, NSError *error))completionHandler;


/// @name Debugging

/** Set a name to a managed object context to aid in debugging. */
@property (nonatomic, copy) NSString *dct_name;

/** Provides a string to log from a validation error given by core data.
 
 @param error The error given by Core Data
 
 @return A human readable string of what's gone wrong.
 */
- (NSString *)dct_detailedDescriptionFromValidationError:(NSError *)error;

@end
