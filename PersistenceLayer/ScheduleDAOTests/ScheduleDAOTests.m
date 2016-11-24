//
//  ScheduleDAOTests.m
//  ScheduleDAOTests
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Schedule.h"
#import "ScheduleDAO.h"
#import "DBHelper.h"
#import "Events.h"

@interface ScheduleDAOTests : XCTestCase

@property (strong, nonatomic) ScheduleDAO *dao;

@property (strong, nonatomic) Schedule *theSchedule;

@end

@implementation ScheduleDAOTests

- (void)setUp {
    [super setUp];
    
    self.dao = [ScheduleDAO sharedInstance];
    
    self.theSchedule = [[Schedule alloc] init];
    self.theSchedule.GameDate = @"test GameDate";
    self.theSchedule.GameTime = @"test GameTime";
    self.theSchedule.GameInfo = @"test GameInfo";
    
//    Events *event = [[Events alloc] init];
//    
//    self.theSchedule.Event = event;
    
    self.theSchedule.Event.EventID = 1;
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.dao = nil;
    [super tearDown];
}

- (void)test_1_Create {

    int res = [self.dao createSchedule:self.theSchedule];
    XCTAssertEqual(res, 0);
    
    
}

- (void)test_2_FindById {
    self.theSchedule.ScheduleID = 502; //局部变量，在其他的测试用例中，self.theSchedule的ScheduleID是0（因为未赋值，初始化默认为0）；
    
    Schedule *resSchedule = [self.dao findById:self.theSchedule];
    
    XCTAssertNotNil(resSchedule, @"查询记录为nil");
    
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate);
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime);
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo);
    XCTAssertEqual(self.theSchedule.Event.EventID, resSchedule.Event.EventID);
}


- (void)test_3_FindAll {
    
    NSArray *list = [self.dao findAll];
    
    XCTAssertEqual([list count], 502);
    
    Schedule *resSchedule = list[501];
    
    XCTAssertNotNil(resSchedule, @"查询记录为nil");
    
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate);
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime);
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo);
    
    
}




- (void)test_4_Modify {
    self.theSchedule.ScheduleID = 502;
    
    
    self.theSchedule.GameDate = @"test Modify GameDate";

    
    int res = [self.dao modifySchedule:self.theSchedule];
    
    XCTAssertEqual(res, 0);
    
    Schedule *resSchedule =  [self.dao findById:self.theSchedule];
    
    XCTAssertNotNil(resSchedule, @"查询记录为nil");
    
    XCTAssertEqualObjects(self.theSchedule.GameDate, resSchedule.GameDate);
    XCTAssertEqualObjects(self.theSchedule.GameTime, resSchedule.GameTime);
    XCTAssertEqualObjects(self.theSchedule.GameInfo, resSchedule.GameInfo);
    XCTAssertEqual(self.theSchedule.Event.EventID, resSchedule.Event.EventID);
    
}

- (void)test_5_Remove {
    self.theSchedule.ScheduleID = 502;
    
    int res = [self.dao removeSchedule:self.theSchedule];
    
    XCTAssertEqual(res, 0);
    
    Schedule *resSchedule = [self.dao findById:self.theSchedule];
    
    XCTAssertNil(resSchedule, @"记录删除失败。");
}

@end
