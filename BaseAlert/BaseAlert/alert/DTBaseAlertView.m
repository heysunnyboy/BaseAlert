//
//  DTBaseAlertView.m
//  
//
//  Created by zhenyong on 16/5/1.
//  Copyright © 2016年 com.lnl. All rights reserved.
//

#import "DTBaseAlertView.h"

@implementation DTBaseAlertView

-(instancetype)initWithType:(DTAlertType)type andWithNav:(BOOL)nav
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    alertType = type;
    isNav = nav;
    [self setUI];
    return self;
}
-(instancetype)initWithType:(DTAlertType)type andWithNav:(BOOL)nav andSetUIAlert:(alertBlock)setUIAlertBlock andShowUIBlock:(alertBlock)showUIBlock andHideUIBlock:(alertBlock)hideUIBlock
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    alertType = type;
    isNav = nav;
    if (setUIAlertBlock) {
        _setUIAlert = setUIAlertBlock;
    }
    if (showUIBlock) {
        _showUIAlert = showUIBlock;
    }
    if (hideUIBlock) {
        _hideUIAlert = hideUIBlock;
    }

    [self setUI];
    return self;
}

-(void)setUI
{
    self.backgroundColor = [UIColor clearColor];
    UIButton *bgView = [[UIButton alloc]initWithFrame:self.frame];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.5;
    [bgView addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bgView];
    if (_setUIAlert) {
        _setUIAlert(self);
    }
    
    [self setAlertView];
}
-(void)show
{
    [self showToDO];
    if (_showUIAlert) {
        _showUIAlert(self);
    }
    if (self.subviews.count == 2) {
        UIView *bgView = self.subviews[0];
        UIView *alertView = self.subviews[1];
        bgView.alpha = 0;
        CGRect frame = alertView.frame;
        frame.origin.y = ScreenHeight;
        alertView.frame = frame;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseIn animations:^{
            if (alertType == DTAlertTypeCenter) {
                CGRect frame = alertView.frame;
                frame.origin.x = (ScreenWidth - alertView.frame.size.width)/2;
                frame.origin.y = (ScreenHeight-alertView.frame.size.height)/2;
                alertView.frame = frame;
            }
            if (alertType == DTAlertTypeBottom) {
                CGRect frame = alertView.frame;
                frame.origin.x = (ScreenWidth - alertView.frame.size.width)/2;
                float y = ScreenHeight-alertView.frame.size.height;
                if (isNav) {
                    y = ScreenHeight-64-alertView.frame.size.height;
                }
                frame.origin.y = y;
                alertView.frame = frame;
            }
            bgView.alpha = 0.5;
        } completion:nil];

    }
}
-(void)hide
{
    [self hideToDO];
    if(_hideUIAlert)
    {
        _hideUIAlert(self);
    }
    if (self.subviews.count == 2) {
        UIView *bgView = self.subviews[0];
        UIView *alertView = self.subviews[1];
        bgView.alpha = 0.5;
        if (alertType == DTAlertTypeCenter) {
            CGRect frame = alertView.frame;
            frame.origin.x = (ScreenWidth - alertView.frame.size.width)/2;
            frame.origin.y = (ScreenHeight-alertView.frame.size.height)/2;
            alertView.frame = frame;
        }
        if (alertType == DTAlertTypeBottom) {
            CGRect frame = alertView.frame;
            frame.origin.x = (ScreenWidth - alertView.frame.size.width)/2;
            frame.origin.y = ScreenHeight-alertView.frame.size.height;
            alertView.frame = frame;
        }

        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect frame = alertView.frame;
            frame.origin.y = ScreenHeight+20;
            alertView.frame = frame;
            bgView.alpha = 0;
        } completion:^(BOOL finish){
            if (finish) {
                [self removeFromSuperview];
            }
        }];
        
    }

}

-(void)setAlertView
{
    
}
-(void)showToDO
{
}
-(void)hideToDO{
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
