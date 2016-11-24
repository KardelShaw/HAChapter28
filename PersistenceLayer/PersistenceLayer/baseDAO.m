//
//  baseDAO.m
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016 Kardel. All rights reserved.
//

#import "baseDAO.h"

@implementation baseDAO

- (id)init {
    self = [super init];
    if (self) {
        //初始化数据库
        [DBHelper initDB];
    }
    return self;
}

- (BOOL)openDB {
    
    const char *dbFilePath = [DBHelper applicationDocunmentsDirectoryFile:DB_FILE_NAME];
    
    NSLog(@"DbFilePath = %s", dbFilePath);
    
    if (sqlite3_open(dbFilePath, &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败。");
        return FALSE;
    }
    return TRUE;
}

@end
