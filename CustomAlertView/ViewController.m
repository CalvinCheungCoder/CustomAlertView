//
//  ViewController.m
//  CustomAlertView
//
//  Created by CalvinCheung on 2017/1/3.
//  Copyright © 2017年 CalvinCheung. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setBtn];
}

- (void)setBtn{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height/2-50, [UIScreen mainScreen].bounds.size.width-40, 44)];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.cornerRadius = 5;
    [btn.layer setBorderColor:[UIColor redColor].CGColor];
    [btn.layer setBorderWidth:1];
    [btn setTitle:@"AlertView" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.tag = 1;
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btnTwo = [[UIButton alloc]initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height/2+5, [UIScreen mainScreen].bounds.size.width-40, 44)];
    btnTwo.backgroundColor = [UIColor whiteColor];
    btnTwo.layer.cornerRadius = 5;
    [btnTwo.layer setBorderColor:[UIColor redColor].CGColor];
    [btnTwo.layer setBorderWidth:1];
    [btnTwo setTitle:@"TwoBtn AlertView" forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnTwo.titleLabel.font = [UIFont systemFontOfSize:20];
    btnTwo.tag = 2;
    [btnTwo addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTwo];
    
}

- (void)BtnClick:(UIButton *)Btn{
    
    if (Btn.tag == 1) {
        [CustomAlertView showOneButtonWithTitle:@"发现新版本" Message:@"fashjfjkdsfjksldbnnnnnnnnnnniufghabenrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrfashjfjkdsfjksldbnnnnnnnnnnniufghabenrrrrrrr;" ButtonType:CustomAlertViewButtonTypeDefault ButtonTitle:@"去更新" Click:^{
            
        }];
    }else{
        
        [CustomAlertView showTwoButtonsWithTitle:nil Message:@"确定要退出当前帐号吗？" ButtonType:CustomAlertViewButtonTypeCancel ButtonTitle:@"取消" Click:^{
            
        } ButtonType:CustomAlertViewButtonTypeWarn ButtonTitle:@"确认" Click:^{
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
