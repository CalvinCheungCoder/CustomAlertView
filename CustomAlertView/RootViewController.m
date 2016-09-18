//
//  RootViewController.m
//  CustomAlertView
//
//  Created by 张丁豪 on 16/9/18.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import "RootViewController.h"
#import "CustomAlertView.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"CustomAlertView";
    
    [self setBtnView];
}


-(void)setBtnView{
    
    NSArray *arr = [NSArray arrayWithObjects:@"无按钮",@"取消按钮",@"取消确定按钮",@"取消确定按钮", nil];
    for (int i = 0; i < 4; i ++) {
        
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(50, 65 * (i + 1) + 20, [UIScreen mainScreen].bounds.size.width - 100, 46);
        btn.layer.cornerRadius = 6;
        btn.backgroundColor = [UIColor orangeColor];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)btnClicked:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [CustomAlertView showWithTitle:@"我是标题,我可以为空" message1:@"我是消息,我也可以为空" druation:1.];
            break;
        case 1:
            [CustomAlertView showWithTitle:@"我是标题,我可以为空" message1:@"我是消息,我也可以为空" cancelButton:@"取消"];
            break;
        case 2:
            [CustomAlertView showWithTitle:@"我是标题,我可以为空" message1:@"我是消息,我也可以为空" cancelButton:@"取消" commitType:KSAlertViewButtonDelete commitAction:^(UIButton *button) {
                NSLog(@"点击了删除按钮");
            }];
            break;
        case 3:
            [CustomAlertView showWithTitle:@"我是标题,我可以为空" message1:@"我是消息,我也可以为空" cancelButton:@"取消" customButton:@"确定" commitAction:^(UIButton *button) {
                NSLog(@"点击了确定按钮");
            }];
            break;
            
        default:
            break;
    }
    
}


@end
