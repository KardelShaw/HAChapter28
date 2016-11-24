//
//  ScheduleDAO.h
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseDAO.h"
#import "Schedule.h"

@interface ScheduleDAO : baseDAO

- (int)createSchedule: (Schedule *)model;

- (int)removeSchedule: (Schedule *)model;

- (NSMutableArray *)findAll;

- (int)modifySchedule: (Schedule *)model;

- (Schedule *)findByID: (Schedule *)model;

@end
