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

- (ToDoItem *) initWithItemName:(NSString *)name completed:(BOOL)completed creationDate:(NSDate *)date {
    self = [super init];
    self.itemName = name;
    self.completed = completed;
    self.creationDate = date;
    return self;
}

- (void)print {
    NSLog(@"%@ %@ %d", self.itemName, self.creationDate, self.completed);
}

#define kItemName       @"itemName"
#define kCompleted      @"completed"
#define kCreationDate   @"creationDate"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.itemName forKey:kItemName];
    [encoder encodeBool:self.completed forKey:kCompleted];
    [encoder encodeObject:self.creationDate forKey:kCreationDate];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *name = [decoder decodeObjectForKey:kItemName];
    BOOL completed = [decoder decodeBoolForKey:kCompleted];
    NSDate *date = [decoder decodeObjectForKey:kCreationDate];
    return [self initWithItemName:name completed:completed creationDate:date];
}

@end
