//
//  Events.h
//  PersistenceLayer
//
//  Created by Kardel on 16/11/22.
//  Copyright © 2016 Kardel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

@property (nonatomic, assign) int EventID;

@property (strong, nonatomic) NSString *EventName;

@property (strong, nonatomic) NSString *EventIcon;

@property (strong, nonatomic) NSString *KeyInfo;

@property (strong, nonatomic) NSString *BasicsInfo;

@property (strong, nonatomic) NSString *OlympicInfo;

@end
