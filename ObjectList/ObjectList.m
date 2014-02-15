//
//  ObjectList.m
//  ObjectList
//
//  Created by Joe Amanse on 3/31/13.
//  Copyright (c) 2013 Chris Amanse. All rights reserved.
//

#import "ObjectList.h"

@implementation ObjectList
@synthesize myObjectList;

- (id)init {
    self = [super init];
    if(self != nil)
        myObjectList = [[NSMutableDictionary alloc] init];
    return self;
}

- (unsigned long)size {
    return (unsigned long)[myObjectList count];
}

- (BOOL)add:(NSMutableDictionary *)object {
    if([object count] != 0) {
        //check if there is already existing object
        for(NSString* key in myObjectList) {
            if([object isEqualToDictionary: [myObjectList objectForKey: key]]) {
                NSLog(@"Trying to add dictionary that already exists!");
                return NO;
            }
        }
        
        [myObjectList setObject: object forKey: [NSString stringWithFormat: @"%lu", [self size]]];
        return YES;
    }
    NSLog(@"Trying to add dictionary with no objects!");
    return NO;
}

-(BOOL)add:(NSMutableDictionary *)object atIndex:(int)index {
    if((index < (int)[self size]) && [self add: object]) {
        NSMutableDictionary* holder;
        int previousIndex, newIndex;
        int max = (int)[self size];
        
        for(int i = max - 1; i > index; i--) {
            previousIndex = i - 1;
            newIndex = i;
            
            holder = [[NSMutableDictionary alloc] init];
            holder = [self objectAt: previousIndex];
            [myObjectList setObject: holder forKey: [NSString stringWithFormat: @"%i", newIndex]];
        }
        [myObjectList setObject: object forKey: [NSString stringWithFormat: @"%i", index]];
        return YES;
    }
    else if(index == [self size]) {
        [self add: object];
        return YES;
    }
    NSLog(@"Trying to add object at index greater than max size!");
    return NO;
}

- (BOOL)removeAt:(int)index {
    NSString* key = [NSString stringWithFormat: @"%i", index];
    
    if([myObjectList objectForKey: key] != nil) {
        [myObjectList removeObjectForKey: key];
        
        //fill empty key and so on with objects in front
        NSMutableDictionary* holder;
        unsigned long max = [self size];
        NSString* previousKey,* newKey;
        
        for(int i = index + 1; i <= max; i++) {
            previousKey = [[NSString alloc] init];
            newKey = [[NSString alloc] init];
            previousKey = [NSString stringWithFormat: @"%i", i];
            newKey = [NSString stringWithFormat: @"%i", i - 1];
            
            holder = [[NSMutableDictionary alloc] init];
            holder = [myObjectList objectForKey: previousKey];
            [myObjectList setObject: holder forKey: newKey];
            [myObjectList removeObjectForKey: previousKey];
        }
        return YES;
    }
    return NO;
}

- (NSMutableDictionary*)objectAt:(int)index {
    return [myObjectList objectForKey: [NSString stringWithFormat: @"%i", index]];
}

- (void)printObject:(NSMutableDictionary *)object {
    for(NSString* key in object) {
        NSLog(@"\t%@:\t%@", key, [object objectForKey: key]);
    }
}

- (void)printObjectAt:(int)index {
    NSMutableDictionary* object = [[NSMutableDictionary alloc] init];
    object = [self objectAt: index];
    [self printObject: object];
}

- (void)printAll {
    for(int i = 0; i <= (int)[self size] - 1; i++) {
        NSLog(@"Key = %i", i);
        [self printObjectAt: i];
    }
}

- (void)removeAll {
    [myObjectList removeAllObjects];
}

- (void)writeToFile:(NSString *)filename {
    if([myObjectList writeToFile: filename atomically: YES])
        NSLog(@"File written");
    NSLog(@"File not written");
}

@end
