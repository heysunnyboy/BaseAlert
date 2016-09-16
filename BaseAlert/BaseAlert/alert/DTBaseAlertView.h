//
//  DTBaseAlertView.h
//  零邻里
//
//  Created by zhenyong on 16/5/1.
//  Copyright © 2016年 com.lnl. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
typedef void (^alertBlock)(UIView *superView);
typedef NS_ENUM (NSInteger , DTAlertType){
    DTAlertTypeCenter,
    DTAlertTypeBottom,
};
@interface DTBaseAlertView : UIView
{
    DTAlertType alertType;
    BOOL isNav;
}

@property (strong , nonatomic) alertBlock setUIAlert;
@property (strong , nonatomic) alertBlock showUIAlert;
@property (strong , nonatomic) alertBlock hideUIAlert;
/**
 *  初始化
 *
 *  @param type  中部alert 还是底部alert
 *  @param isNav 是否包含导航栏
 *
 *  @return 初始化对象
 */
-(instancetype)initWithType:(DTAlertType)type andWithNav:(BOOL)isNav;
/**
 *  初始化
 *
 *  @param type  中部alert 还是底部alert
 *  @param isNav 是否包含导航栏
 *  @param setUIAlertBlock 设置alertView
 *  @param showUIBlock     显示alertView
 *  @param hideUIBlock     隐藏lertView
 *
 *  @return <#return value description#>
 */
-(instancetype)initWithType:(DTAlertType)type andWithNav:(BOOL)nav andSetUIAlert:(alertBlock)setUIAlertBlock andShowUIBlock:(alertBlock)showUIBlock andHideUIBlock:(alertBlock)hideUIBlock;
-(void)show;
-(void)hide;
/**
 *  alertView
 */
-(void)setAlertView;
/**
 *  显示时执行的工作
 */
-(void)showToDO;
/**
 *  隐藏时执行的工作
 */
-(void)hideToDO;
@end
