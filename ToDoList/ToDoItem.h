//
//  ToDoItem.h
//  ToDoList
//
//  Created by 孫　忠飛 on 3/17/15.
//  Copyright (c) 2015 pomn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
