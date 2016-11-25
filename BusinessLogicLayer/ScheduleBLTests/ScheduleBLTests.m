//
//  ScheduleBLTests.m
//  ScheduleBLTests
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <PersistenceLayer/ScheduleDAO.h>
#import <PersistenceLayer/Schedule.h>
#import "ScheduleBL.h"

@interface ScheduleBLTests : XCTestCase

@property (strong, nonatomic) ScheduleBL *bl;

@property (strong, nonatomic) Schedule *schedule;

@end

@implementation ScheduleBLTests

- (void)setUp {
    [super setUp];
    
    self.bl = [[ScheduleBL alloc] init];
    
    self.schedule = [[Schedule alloc] init];
    
    self.schedule.GameDate = @"test GameDate";
    self.schedule.GameTime = @"test GameTime";
    self.schedule.GameInfo = @"test GameInfo";
    
    Events *event = [[Events alloc] init];
    
    event.EventName = @"Cycling Mountain Bike";
    event.EventID = 10;
    
    self.schedule.Event = event;
    
    //插入测试数据
    ScheduleDAO *dao = [ScheduleDAO sharedInstance];
    [dao createSchedule:self.schedule];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    //删除测试数据
    
    self.schedule.ScheduleID = 502;
    
    ScheduleDAO *dao = [ScheduleDAO sharedInstance];
    
    [dao removeSchedule:self.schedule];

    [super tearDown];
}

- (void)test_ReadData {
    
    self.schedule.ScheduleID = 502;
    
    NSMutableDictionary *resList = [self.bl readData];
    
    NSArray *allkey = [resList allKeys];
    
    XCTAssertEqual([allkey count], 18);
    
    NSArray *list = resList[self.schedule.GameDate];
    
    Schedule *resSchedule = list[0];
    
    XCTAssertEqualObjects(self.schedule.GameDate, resSchedule.GameDate);
    XCTAssertEqualObjects(self.schedule.GameTime, resSchedule.GameTime);
    XCTAssertEqualObjects(self.schedule.GameInfo, resSchedule.GameInfo);
    XCTAssertEqual(self.schedule.Event.EventID, resSchedule.Event.EventID);
    XCTAssertEqual(self.schedule.ScheduleID, resSchedule.ScheduleID);
    
}


@end
