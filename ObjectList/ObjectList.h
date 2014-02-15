//
//  ObjectList.h
//  ObjectList
//
//  Created by Joe Amanse on 3/31/13.
//  Copyright (c) 2013 Chris Amanse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectList : NSObject {
    NSMutableDictionary* myObjectList;
}
@property (retain) NSMutableDictionary* myObjectList;

- (id)init;
- (unsigned long)size;
- (BOOL)add: (NSMutableDictionary*)object;
- (BOOL)add: (NSMutableDictionary*)object atIndex: (int)index;
- (BOOL)removeAt: (int)index;
- (NSMutableDictionary*)objectAt: (int)index;
- (void)printObject: (NSMutableDictionary*)object;
- (void)printObjectAt: (int)index;
- (void)printAll;
- (void)removeAll;
- (void)writeToFile: (NSString*)filename;

@end
