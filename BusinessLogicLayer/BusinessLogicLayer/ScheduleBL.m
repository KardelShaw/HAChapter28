//
//  ScheduleBL.m
//  BusinessLogicLayer
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import "ScheduleBL.h"

@implementation ScheduleBL


-(NSMutableDictionary *)readData {
    
    ScheduleDAO *scheduleDAO = [ScheduleDAO sharedInstance];
    
    NSMutableArray *schedules = [scheduleDAO findAll];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    EventsDAO *eventsDAO = [EventsDAO sharedInstance];
    
    
    for (Schedule *schedule in schedules) {
        
        Events *event = [eventsDAO findById:schedule.Event];
        
        schedule.Event = event;
        
        NSArray *allKeys = [dict allKeys];
        
        
        
        if ([allKeys containsObject:schedule.GameDate]) {
            NSMutableArray *value = dict[schedule.GameDate];
            [value addObject:schedule];
        } else {
            
            NSMutableArray *value = [[NSMutableArray alloc] init];
            [value addObject:schedule];
            dict[schedule.GameDate] = value;
            
        }
        
        
    }
    
    
    return dict;
}

@end
