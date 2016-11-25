//
//  CountDownViewController.m
//  PresentationLayer
//
//  Created by Kardel on 16/11/25.
//  Copyright © 2016年 Kardel. All rights reserved.
//

#import "CountDownViewController.h"

@interface CountDownViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblCountDown;

@end

@implementation CountDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建NSDateComponents对象
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    //设置NSDateComponents日期
    [comps setDay:5];
    //设置NSDateComponents月份
    [comps setMonth:8];
    //设置NSDateComponents年
    [comps setYear:2016];
    
    //创建日历对象
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //获得2016-08-05的NSDate日期对象
    NSDate *destinationDate = [calendar dateFromComponents:comps];
    
    //获得当前日期到2016-08-05的NSDateComponents对象
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:destinationDate options:NSCalendarWrapComponents];
    
    //获得当前日期到2016-08-05相差的天数
    NSInteger days = [components day];
    
    NSMutableAttributedString *strLabel = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%li天", (long)days]];
    
    [strLabel addAttribute:NSFontAttributeName value:[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote] range:NSMakeRange(strLabel.length - 1, 1)];
    
    self.lblCountDown.attributedText = strLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
