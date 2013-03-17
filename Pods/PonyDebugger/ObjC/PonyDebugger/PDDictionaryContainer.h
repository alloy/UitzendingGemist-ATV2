//
//  PDDictionaryContainer.h
//  PonyDebugger
//
//  Created by Wen-Hao Lue on 8/9/12.
//
//  Licensed to Square, Inc. under one or more contributor license agreements.
//  See the LICENSE file distributed with this work for the terms under
//  which Square, Inc. licenses this file to you.
//

#import <PonyDebugger/PonyDebugger.h>


@class PDRuntimePropertyDescriptor;


@interface PDDictionaryContainer : PDObject

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end


@interface PDDictionaryContainer (PDRuntimePropertyDescriptor)

- (NSArray *)PD_propertiesForPropertyDescriptors;
- (PDRuntimePropertyDescriptor *)PD_propertyDescriptorForPropertyObject:(NSObject *)property;

@end
