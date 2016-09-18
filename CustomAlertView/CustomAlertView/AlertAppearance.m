//
//  AlertAppearance.m
//  CustomAlertView
//
//  Created by 张丁豪 on 16/9/18.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import "AlertAppearance.h"

@implementation AlertAppearance

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // alertView
        self.AlertMaskViewColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.AlertViewPadding = UIEdgeInsetsMake(30, 20, 30, 20);
        self.AlertViewColor = [UIColor whiteColor];
        self.AlertViewCornerRadius = 4.;
        
        // title
        NSMutableParagraphStyle* titleStyle = [[NSMutableParagraphStyle alloc] init];
        titleStyle.lineSpacing = 5;
        titleStyle.alignment = NSTextAlignmentCenter;
        
        self.AlertTitleAttributed = @{
                                        NSFontAttributeName:[UIFont systemFontOfSize:17],
                                        NSForegroundColorAttributeName:RGB(45, 43, 51),
                                        NSParagraphStyleAttributeName:titleStyle,
                                        };
        
        // message1
        NSMutableParagraphStyle* message1Style = [[NSMutableParagraphStyle alloc] init];
        message1Style.lineSpacing = 5;
        message1Style.alignment = NSTextAlignmentCenter;
        
        self.AlertMessage1Attributed = @{
                                           NSFontAttributeName:[UIFont systemFontOfSize:17],
                                           NSForegroundColorAttributeName:RGB(155, 155, 155),
                                           NSParagraphStyleAttributeName:message1Style
                                           };
        self.AlertMessage1TopMargin  = 15.;
        
        // line
        self.horizontalLineColor = [UIColor clearColor];
        self.verticalLineColor = RGB(159,157,166);
        
        // cancelTitle
        self.AlertCancelTitleAttributed = @{
                                              NSFontAttributeName:[UIFont systemFontOfSize:17],
                                              NSForegroundColorAttributeName:RGB(159,157,166)
                                              };
        
        // customTitle
        self.AlertCustomTitleAttributed = @{
                                              NSFontAttributeName:[UIFont systemFontOfSize:17],
                                              NSForegroundColorAttributeName:RGB(0, 145, 255)
                                              };
        
        // deleteTitle
        self.AlertCommitTitleAttributed = @{
                                              NSFontAttributeName:[UIFont systemFontOfSize:17],
                                              NSForegroundColorAttributeName:RGB(255, 100, 0)
                                              };
        // Animation
        self.KSAlertAnimationStyle = AlertAnimationStyleDefault;
        
    }
    return self;
}


@end
