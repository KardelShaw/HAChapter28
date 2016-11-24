//
//  EventsBLTests.m
//  EventsBLTests
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <PersistenceLayer/EventsDAO.h>
#import <PersistenceLayer/Events.h>
#import "EventsBL.h"

@interface EventsBLTests : XCTestCase

@property (strong, nonatomic) EventsBL *bl;
@property (strong, nonatomic) Events *event;

@end

@implementation EventsBLTests

- (void)setUp {
    [super setUp];
   
    self.bl = [[EventsBL alloc] init];
    self.event = [[Events alloc] init];
    
    self.event.EventName = @"test EventName";
    self.event.EventIcon = @"test EventIcon";
    self.event.KeyInfo = @"test KeyInfo";
    self.event.BasicsInfo = @"test BasicsInfo";
    self.event.OlympicInfo = @"test OlympicInfo";
    
    EventsDAO *dao = [EventsDAO sharedInstance];
    
    [dao create:self.event];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    //删除测试数据
    self.event.EventID = 41;
    EventsDAO *dao = [EventsDAO sharedInstance];
    [dao remove:self.event];
    
    self.bl = nil;
    
    [super tearDown];
}

- (void)test_ReadData {
    
    self.event.EventID = 41;
    
    NSArray *resList  = [self.bl readData];
    
    XCTAssertEqual([resList count], 41);
    
    Events *resEvent = resList[40];
    
    XCTAssertEqualObjects(self.event.EventName, resEvent.EventName);
    XCTAssertEqualObjects(self.event.EventIcon, resEvent.EventIcon);
    XCTAssertEqualObjects(self.event.KeyInfo, resEvent.KeyInfo);
    XCTAssertEqualObjects(self.event.BasicsInfo, resEvent.BasicsInfo);
    XCTAssertEqual(self.event.EventID, resEvent.EventID);
}

@end
