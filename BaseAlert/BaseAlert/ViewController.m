//
//  ViewController.m
//  BaseAlert
//
//  Created by zhenyong on 16/9/16.
//  Copyright © 2016年 com.demo. All rights reserved.
//

#import "ViewController.h"
#import "DTNormalAlert.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    NSArray *arr = @[@"中部alert",@"底部alert",@"非继承中部alert",@"非继承底部alert"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 150*i+30, 100, 100)];
        button.backgroundColor = [UIColor redColor];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(alert:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
    }
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)alert:(UIButton *)btn{
    if (btn.tag < 2) {
        DTNormalAlert *alertView;
        if (btn.tag == 0) {
            alertView = [[DTNormalAlert alloc]initWithType:DTAlertTypeCenter andWithNav:NO];
        }
        else
        {
            alertView = [[DTNormalAlert alloc]initWithType:DTAlertTypeBottom andWithNav:NO];
        }
        [self.view addSubview:alertView];
        [alertView show];

    }
    else
    {
        DTBaseAlertView *alertView;
        if (btn.tag == 2) {
            
            alertView = [[ DTBaseAlertView alloc]initWithType:DTAlertTypeCenter andWithNav:NO andSetUIAlert:^(UIView *superView){
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 280)];
                view.backgroundColor = [UIColor blueColor];
                [superView addSubview:view];
                
            } andShowUIBlock:^(UIView *superView){
                NSLog(@"showing  ---");
            } andHideUIBlock:^(UIView *superView){
                NSLog(@"hideing ----");
            }];
        }
        else
        {
            alertView = [[ DTBaseAlertView alloc]initWithType:DTAlertTypeBottom andWithNav:NO andSetUIAlert:^(UIView *superView){
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 280)];
                view.backgroundColor = [UIColor blueColor];
                [superView addSubview:view];
                
            } andShowUIBlock:^(UIView *superView){
                NSLog(@"showing  ---");
            } andHideUIBlock:^(UIView *superView){
                NSLog(@"hideing ----");
            }];

        }
    [self.view addSubview:alertView];
    [alertView show];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
