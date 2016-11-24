//
//  ScheduleDAO.m
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import "ScheduleDAO.h"

@implementation ScheduleDAO

static ScheduleDAO *sharedSingleton = nil;

+ (ScheduleDAO *)sharedInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = [[super alloc] init];
    });
    return sharedSingleton;
}

- (int)createSchedule:(Schedule *)model {
    
    if ([self openDB]) {
        
        NSString *sql = @"INSERT INTO Schedule(GameDate, GameTime, GameInfo, Event) VALUES(?,?,?,?)";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_DONE) {
            
            sqlite3_bind_text(statement, 1, [model.GameDate UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [model.GameTime UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 3, [model.GameInfo UTF8String], -1, NULL);
            sqlite3_bind_int(statement, 4, model.Event.EventID);
            
            if (sqlite3_step(statement) != SQLITE_DONE) {
                sqlite3_finalize(statement);
                sqlite3_close(db);
                NSAssert(FALSE, @"插入数据失败");
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return 0;
}

- (int)removeSchedule:(Schedule *)model {
    
    if ([self openDB]) {
        
        NSString *sql = [[NSString alloc] initWithFormat:@"DELETE from Schedule where ScheduleID = %i", model.ScheduleID];
        
        //开启事务
        sqlite3_exec(db, "BEGIN IMMEDIATE TRANSACTION", NULL, NULL, NULL);
        
        char *err;
        
        if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
            //回滚事务
            sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
            NSAssert(FALSE, @"删除数据失败。");
        }
        
        sqlite3_close(db);
    }
    return 0;
}


- (int)modifySchedule:(Schedule *)model {
    
    NSString *sql = @"UPDATE Schedule SET GameDate=?, GameTime=?, GameInfo=?, EventID=? where ScheduleID=?";
    
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        
        sqlite3_bind_text(statement, 1, [model.GameDate UTF8String], -1, NULL);
        sqlite3_bind_text(statement, 2, [model.GameTime UTF8String], -1, NULL);
        sqlite3_bind_text(statement, 3, [model.GameInfo UTF8String], -1, NULL);
        sqlite3_bind_int(statement, 4, model.Event.EventID);
        sqlite3_bind_int(statement, 5, model.ScheduleID);
        
        if (sqlite3_step(statement) != SQLITE_DONE) {
            sqlite3_finalize(statement);
            sqlite3_close(db);
            NSAssert(FALSE, @"修改数据失败。");
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return 0;
}

- (NSMutableArray *)findAll {
    
    NSMutableArray *listData;
    
    if ([self openDB]) {
        
        NSString *sql = @"SELECT GameDate, GameTime, GameInfo, EventID, ScheduleID FROM Schedule";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) != SQLITE_OK) {
            
            listData = [[NSMutableArray alloc] init];
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                Schedule *schedule = [[Schedule alloc] init];
                Events *event = [[Events alloc] init];
                schedule.Event = event;
                
                char *cGameDate = (char *)sqlite3_column_text(statement, 0);
                schedule.GameDate = [[NSString alloc] initWithUTF8String:cGameDate];
                
                char *cGameTime = (char *)sqlite3_column_text(statement, 1);
                schedule.GameTime = [[NSString alloc] initWithUTF8String:cGameTime];
                
                char *cGameInfo = (char *)sqlite3_column_text(statement, 2);
                schedule.GameInfo = [[NSString alloc] initWithUTF8String:cGameInfo];
                
                schedule.Event.EventID = sqlite3_column_int(statement, 3);
                
                schedule.ScheduleID = sqlite3_column_int(statement, 4);
                
                [listData addObject:schedule];
                
                sqlite3_finalize(statement);
                sqlite3_close(db);
                
                return listData;
            }
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    
    return listData;
    
}


- (Schedule *)findById:(Schedule *)model {

    Schedule *schedule;
    
    if ([self openDB]) {
        
        NSString *sql = @"SELECT GameDate, GameTime, GameInfo, EventID, ScheduleID where ScheduleID=?";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_int(statement, 1, model.ScheduleID);
            
            if (sqlite3_step(statement) == SQLITE_ROW) {
                
                schedule = [[Schedule alloc] init];
                Events *event = [[Events alloc] init];
                
                schedule.Event = event;
                
                char *cGameDate = (char *)sqlite3_column_text(statement, 0);
                schedule.GameDate = [[NSString alloc] initWithUTF8String:cGameDate];
                
                char *cGameTime = (char *)sqlite3_column_text(statement, 1);
                schedule.GameTime = [[NSString alloc] initWithUTF8String:cGameTime];
                
                char *cGameInfo = (char *)sqlite3_column_text(statement, 2);
                schedule.GameInfo = [[NSString alloc] initWithUTF8String:cGameInfo];
                
                schedule.Event.EventID = sqlite3_column_int(statement, 3);
                schedule.ScheduleID = sqlite3_column_int(statement, 4);
                
                
                sqlite3_finalize(statement);
                sqlite3_close(db);
                return schedule;
            }
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
        
    }
    
    
    return schedule;
}
@end
