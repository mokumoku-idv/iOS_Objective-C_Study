//
//  ToDoItem.m
//  ToDoList
//
//  Created by 孫　忠飛 on 3/17/15.
//  Copyright (c) 2015 pomn. All rights reserved.
//

#import "ToDoItem.h"

@interface ToDoItem ()
// Redeclare property as readwrite
@property (readwrite) NSDate *creationDate;

@end


@implementation ToDoItem

@synthesize creationDate;

- (ToDoItem *) init {
    self = [super init];
    self.creationDate = [NSDate date];
    return self;
}

- (void)print {
    NSLog(@"%@ %@ %d", self.itemName, self.creationDate, self.completed);
}

@end
