//
//  Schedule.h
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"

@interface Schedule : NSObject

@property (nonatomic, assign) int ScheduleID;

@property (nonatomic, strong) NSString *GameDate;

@property (nonatomic, strong) NSString *GameTime;

@property (nonatomic, strong) NSString *GameInfo;

@property (nonatomic, strong) Events *Event;

@end
