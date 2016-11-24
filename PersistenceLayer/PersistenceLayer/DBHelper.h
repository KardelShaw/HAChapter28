//
//  DBHelper.h
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

#define DB_FILE_NAME @"app.db"

static sqlite3 *db;

@interface DBHelper : NSObject

//获得沙箱Document目录下的全路径
+ (const char *)applicationDocunmentsDirectoryFile: (NSString *)fileName;

//初始化并加载数据
+ (void)initDB;

//从数据库获得当前数据库的版本号
+ (int)dbVersionNumber;

@end
