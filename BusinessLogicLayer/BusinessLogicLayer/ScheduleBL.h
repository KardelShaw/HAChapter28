//
//  ScheduleBL.h
//  BusinessLogicLayer
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <PersistenceLayer/ScheduleDAO.h>
#import <PersistenceLayer/Schedule.h>
#import <PersistenceLayer/EventsDAO.h>
#import <PersistenceLayer/Events.h>

@interface ScheduleBL : NSObject


- (NSMutableDictionary *)readData;

@end
