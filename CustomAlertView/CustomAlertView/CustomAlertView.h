//
//  CustomAlertView.h
//  CustomAlertView
//
//  Created by 张丁豪 on 16/9/18.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, AlertViewButtonType) {
    KSAlertViewButtonCommit = 0,
    KSAlertViewButtonDelete,
};

typedef void(^CommitAction)(UIButton* button);

@class AlertAppearance;

@interface CustomAlertView : UIView

+ (AlertAppearance *)appearances;

// 标题, 消息1,自动消失
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 druation:(NSTimeInterval)druation;

// 标题, 消息1,取消按钮
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 cancelButton:(NSString*)cancelTitle;

// 标题, 消息1,取消按钮,确定按钮
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 cancelButton:(NSString*)cancelTitle customButton:(NSString*)commitTitle commitAction:(CommitAction)commitAction;

// 标题, 消息1,取消按钮,确定按钮(给定默认按钮样式)
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 cancelButton:(NSString*)cancelTitle commitType:(AlertViewButtonType)type commitAction:(CommitAction)commitAction;

@end


@interface UIButton (block)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(CommitAction)action;

@end
