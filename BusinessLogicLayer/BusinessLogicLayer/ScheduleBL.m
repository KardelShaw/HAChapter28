//
//  ScheduleBL.m
//  BusinessLogicLayer
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import "ScheduleBL.h"

@implementation ScheduleBL


-(NSMutableArray *)readData {
    
    ScheduleDAO *dao = [ScheduleDAO sharedInstance];
    
    NSMutableArray *list = [dao findAll];
    
    return list;
}

@end
