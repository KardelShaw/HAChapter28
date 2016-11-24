//
//  EventsBL.h
//  BusinessLogicLayer
//
//  Created by Kardel on 16/11/24.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <PersistenceLayer/Events.h>
#import <PersistenceLayer/EventsDAO.h>

@interface EventsBL : NSObject


//查询所有数据的方法
- (NSMutableArray *) readData;


@end
