//
//  ToDoItem.h
//  ToDoList
//
//  Created by 孫　忠飛 on 3/17/15.
//  Copyright (c) 2015 pomn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject <NSCoding>

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

- (ToDoItem *)initWithItemName:(NSString *)name completed:(BOOL)completed creationDate:(NSDate *)date;
- (void)print;

@end
