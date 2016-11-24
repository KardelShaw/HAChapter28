//
//  baseDAO.h
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "DBHelper.h"

@interface baseDAO : NSObject {
    sqlite3 *db;
}

- (BOOL)openDB;

@end
