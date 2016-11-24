//
//  EventsBL.m
//  BusinessLogicLayer
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import "EventsBL.h"

@implementation EventsBL


-(NSMutableArray *)readData {
    
    EventsDAO *dao = [EventsDAO sharedInstance];
    
    NSMutableArray *list = [dao findAll];
    
    return list;
}


@end
