//
//  main.m
//  ObjectList
//
//  Created by Joe Amanse on 3/31/13.
//  Copyright (c) 2013 Chris Amanse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectList.h"

int main(int argc, const char * argv[])
{
    NSLog(@"Launched");
    ObjectList* myObjects = [[ObjectList alloc] init];
    NSMutableDictionary *newObject;
    
    //populates myObjects with contents of file (CREATE NEW INSTANCE METHOD FOR THIS!)
    myObjects.myObjectList = [myObjects.myObjectList initWithContentsOfFile: @"sample.plist"];
    if([myObjects.myObjectList count] == 0) {
        myObjects = [[ObjectList alloc] init];
    }
    
    //code snippet to add object into objectlist (example of adding existing dictionary)
    newObject = [[NSMutableDictionary alloc] init];
    [newObject setObject: @"Joe" forKey: @"firstName"];
    [newObject setObject: @"Smith" forKey: @"middleName"];
    [newObject setObject: @"Johnson" forKey: @"lastName"];
    [newObject setObject: @"104235" forKey: @"idNumber"];
    [myObjects add: newObject atIndex: 1]; //add object at index
    
    //example of adding dictionary with no objects
    newObject = [[NSMutableDictionary alloc] init];
    [myObjects add: newObject];
    
    //print all objects in objectlist
    [myObjects printAll];
    return 0;
}

