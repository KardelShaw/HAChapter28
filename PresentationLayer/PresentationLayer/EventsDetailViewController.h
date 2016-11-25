//
//  EventsDetailViewController.h
//  PresentationLayer
//
//  Created by Kardel on 16/11/25.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BusinessLogicLayer/EventsBL.h>

@interface EventsDetailViewController : UIViewController


@property (strong, nonatomic) Events *event;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblEventName;
@property (weak, nonatomic) IBOutlet UITextView *txtViewKeyInfo;
@property (weak, nonatomic) IBOutlet UITextView *txtViewBasicsInfo;
@property (weak, nonatomic) IBOutlet UITextView *txtViewOlympicInfo;



@end
