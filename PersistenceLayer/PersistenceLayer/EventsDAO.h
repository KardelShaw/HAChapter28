//
//  EventsDAO.h
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "baseDAO.h"
#import "Events.h"

@interface EventsDAO : baseDAO

- (int)create: (Events *)model;

- (int)remove: (Events *)model;

- (NSMutableArray *)findAll;

- (int)modify: (Events *)model;

- (Events *)findByID: (int)modelID;

@end
