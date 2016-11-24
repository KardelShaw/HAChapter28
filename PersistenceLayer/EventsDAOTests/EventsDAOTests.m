//
//  EventsDAOTests.m
//  EventsDAOTests
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "EventsDAO.h"
#import "Events.h"
#import "DBHelper.h"

@interface EventsDAOTests : XCTestCase

@property (nonatomic,strong) EventsDAO * dao;
@property (nonatomic,strong) Events * theEvents;

@end

@implementation EventsDAOTests

- (void)setUp {
    [super setUp];
    
    //创建EventsDAO对象
    self.dao = [EventsDAO sharedInstance];
    //创建Events对象
    self.theEvents = [[Events alloc] init];
    self.theEvents.EventName = @"test EventName";
    self.theEvents.EventIcon = @"test EventIcon";
    self.theEvents.KeyInfo = @"test KeyInfo";
    self.theEvents.BasicsInfo = @"test BasicsInfo";
    self.theEvents.OlympicInfo = @"test OlympicInfo";
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    self.dao = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//测试 插入Events方法
-(void) test_1_Create {
    int res = [self.dao create:self.theEvents];
    //断言 无异常，返回值为0，
    XCTAssertEqual(res, 0);
}

//测试 按照主键查询数据方法
-(void) test_2_FindById {
    self.theEvents.EventID = 41;
    Events* resEvents = [self.dao findById:self.theEvents];
    //断言 查询结果非nil
    XCTAssertNotNil(resEvents, @"查询记录为nil");
    //断言
    XCTAssertEqualObjects(self.theEvents.EventName ,resEvents.EventName);
    XCTAssertEqualObjects(self.theEvents.EventIcon ,resEvents.EventIcon);
    XCTAssertEqualObjects(self.theEvents.KeyInfo ,resEvents.KeyInfo);
    XCTAssertEqualObjects(self.theEvents.BasicsInfo ,resEvents.BasicsInfo);
    XCTAssertEqualObjects(self.theEvents.OlympicInfo ,resEvents.OlympicInfo);
}

//测试 查询所有数据方法
-(void) test_3_FindAll {
    NSArray* list =  [self.dao findAll];
    //断言 查询记录数为1
    XCTAssertEqual([list count], 41);
    
    Events* resEvents  = list[40];
    //断言
    XCTAssertEqualObjects(self.theEvents.EventName ,resEvents.EventName);
    XCTAssertEqualObjects(self.theEvents.EventIcon ,resEvents.EventIcon);
    XCTAssertEqualObjects(self.theEvents.KeyInfo ,resEvents.KeyInfo);
    XCTAssertEqualObjects(self.theEvents.BasicsInfo ,resEvents.BasicsInfo);
    XCTAssertEqualObjects(self.theEvents.OlympicInfo ,resEvents.OlympicInfo);
}

//测试 修改Events方法
-(void) test_4_Modify {
    self.theEvents.EventID = 41;
    self.theEvents.EventName = @"test modify EventName";
    
    int res = [self.dao modify:self.theEvents];
    //断言 无异常，返回值为0
    XCTAssertEqual(res, 0);
    
    Events* resEvents = [self.dao findById:self.theEvents];
    //断言 查询结果非nil
    XCTAssertNotNil(resEvents, @"查询记录为nil");
    //断言
    XCTAssertEqualObjects(self.theEvents.EventName ,resEvents.EventName);
    XCTAssertEqualObjects(self.theEvents.EventIcon ,resEvents.EventIcon);
    XCTAssertEqualObjects(self.theEvents.KeyInfo ,resEvents.KeyInfo);
    XCTAssertEqualObjects(self.theEvents.BasicsInfo ,resEvents.BasicsInfo);
    XCTAssertEqualObjects(self.theEvents.OlympicInfo ,resEvents.OlympicInfo);
    
}

//测试 删除数据方法
-(void) test_5_Remove {
    self.theEvents.EventID = 41;
    
    int res =   [self.dao remove:self.theEvents];
    //断言 无异常，返回值为0
    XCTAssertEqual(res, 0);
    
    Events* resEvents = [self.dao findById:self.theEvents];
    //断言 查询结果nil
    XCTAssertNil(resEvents, @"记录删除失败");
    
}

@end
