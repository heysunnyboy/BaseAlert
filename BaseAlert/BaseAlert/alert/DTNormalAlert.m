//
//  DTNormalAlert.m
//  BaseAlert
//
//  Created by zhenyong on 16/9/16.
//  Copyright © 2016年 com.demo. All rights reserved.
//

#import "DTNormalAlert.h"

@implementation DTNormalAlert

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setAlertView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 280)];
    view.backgroundColor = [UIColor blueColor];
    [self addSubview:view];
}
-(void)showToDO
{
    NSLog(@"showing ---------");
}
-(void)hideToDO
{
    NSLog(@"hiding -----------");
}
@end
