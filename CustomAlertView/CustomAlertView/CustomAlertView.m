//
//  CustomAlertView.m
//  CustomAlertView
//
//  Created by 张丁豪 on 16/9/18.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import "CustomAlertView.h"
#import "AlertAppearance.h"

//屏幕尺寸
#define FullScreen [UIScreen mainScreen].bounds
//AlertViewWidth
#define AlertWidth (FullScreen.size.width - 2 *40)
//按钮默认高度
#define AlertBtnHeight (44)

@interface CustomAlertView ()

@property (nonatomic, strong) UIWindow* window;

@property (nonatomic, strong) UIView* alertView;

@end

@implementation CustomAlertView

{
    UILabel* _titleLabel;
    UILabel* _message1Label;
    
    UIButton* _cancelButton;
    UIButton* _commitButton;
    
    UIView* _horizontalLine;
    UIView* _verticalLine;
    
    NSTimeInterval _druation;
}


- (void)show{
    
    [self.window becomeKeyWindow];
    [self.window makeKeyAndVisible];
    [self.window addSubview:self];
    
    [self setShowAnimation];
}
- (void)dismiss{
    
    [self.window resignKeyWindow];
    
    [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication].delegate.window becomeKeyWindow];
    
    [self removeFromSuperview];
}

- (instancetype)initWithTitle:(NSString *)title message1:(NSString *)message1 cancelButton:(NSString*)cancelTitle commitButton:(NSString*)commitTitle commitAction:(CommitAction)commitAction druation:(NSTimeInterval)druation{
    
    if (self = [super init]) {
        {
            //初始化窗体
            self.window = [[UIWindow alloc] initWithFrame:FullScreen];
            self.window.windowLevel = UIWindowLevelAlert;
        }
        {
            //背景区域
            self.backgroundColor = [CustomAlertView appearances].AlertMaskViewColor;
            self.frame = FullScreen;
            self.userInteractionEnabled = YES;
        }
        {
            //显示区域
            self.alertView = [[UIView alloc] init];
            self.alertView.backgroundColor = [CustomAlertView appearances].AlertViewColor;
            self.alertView.userInteractionEnabled = YES;
            [self addSubview:self.alertView];
        }
        
        {
            //title
            if (title) {
                _titleLabel = [[UILabel alloc] init];
                [self.alertView addSubview:_titleLabel];
                
                _titleLabel.numberOfLines = 0;
                _titleLabel.attributedText = [[NSAttributedString alloc] initWithString:title attributes:[CustomAlertView appearances].AlertTitleAttributed];
            }
        }
        
        {
            //message1
            if (message1) {
                _message1Label = [[UILabel alloc] init];
                
                _message1Label.numberOfLines = 0;
                _message1Label.attributedText = [[NSAttributedString alloc] initWithString:message1 attributes:[CustomAlertView appearances].AlertMessage1Attributed];
                [self.alertView addSubview:_message1Label];
            }
        }
        
        {
            //cancelButton
            if (cancelTitle) {
                _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
                _cancelButton.backgroundColor = RGB(240, 240, 240);
                
                [_cancelButton setAttributedTitle:[[NSAttributedString alloc] initWithString:cancelTitle attributes:[CustomAlertView appearances].AlertCancelTitleAttributed] forState:UIControlStateNormal];
                [_cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
                [self.alertView addSubview:_cancelButton];
            }
        }
        
        {
            //commitButton
            if (commitTitle) {
                _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
                _commitButton.backgroundColor = RGB(240, 240, 240);
                
                if ([commitTitle isEqualToString:@"删除"]) {
                    [_commitButton setAttributedTitle:[[NSAttributedString alloc] initWithString:commitTitle attributes:[CustomAlertView appearances].AlertCommitTitleAttributed] forState:UIControlStateNormal];
                }else{
                    [_commitButton setAttributedTitle:[[NSAttributedString alloc] initWithString:commitTitle attributes:[CustomAlertView appearances].AlertCustomTitleAttributed] forState:UIControlStateNormal];
                }
                
                [_commitButton handleControlEvent:UIControlEventTouchUpInside withBlock:commitAction];
                [_commitButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
                [self.alertView addSubview:_commitButton];
            }
        }
        
        {
            //水平分割线
            if (cancelTitle || commitTitle) {
                _horizontalLine = [[UIView alloc] init];
                _horizontalLine.backgroundColor = [CustomAlertView appearances].horizontalLineColor;
                [self.alertView addSubview:_horizontalLine];
            }
            //垂直分割线
            if (commitTitle) {
                _verticalLine = [[UIView alloc] init];
                _verticalLine.backgroundColor = [CustomAlertView appearances].verticalLineColor;
                [self.alertView addSubview:_verticalLine];
            }
        }
        
        {
            //alertView
            self.alertView.layer.cornerRadius = [CustomAlertView appearances].AlertViewCornerRadius;
            self.alertView.layer.masksToBounds = YES;
        }
        
        {
            //保存变量
            _druation = druation;
        }
    }
    return self;
}

- (void)layoutSubviews{
    
    CGFloat topMargin = [CustomAlertView appearances].AlertViewPadding.top;
    CGFloat leftMargin = [CustomAlertView appearances].AlertViewPadding.left;
    CGFloat rightMargin = [CustomAlertView appearances].AlertViewPadding.right;
    CGFloat height = 0;
    
    if (_titleLabel) {
        CGFloat titleX = leftMargin;
        CGFloat titleY = topMargin;
        CGFloat titleW = AlertWidth - leftMargin - rightMargin;
        CGFloat titleH = _titleLabel.frame.size.height;
        _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
        [_titleLabel sizeToFit];
        _titleLabel.center = CGPointMake(AlertWidth / 2, _titleLabel.center.y);
        
        height = CGRectGetMaxY(_titleLabel.frame) + 30;
        
    }
    
    if (_message1Label) {
        CGFloat message1X = leftMargin;
        CGFloat message1Y = CGRectGetMaxY(_titleLabel.frame) + [CustomAlertView appearances].AlertMessage1TopMargin;
        CGFloat message1W = AlertWidth - leftMargin - rightMargin;
        CGFloat message1H = _message1Label.frame.size.height;
        _message1Label.frame = CGRectMake(message1X, message1Y, message1W, message1H);
        [_message1Label sizeToFit];
        _message1Label.center = CGPointMake(AlertWidth / 2, _message1Label.center.y);
        
        height = CGRectGetMaxY(_message1Label.frame) + 30;
    }
    
    if (_cancelButton && (!_commitButton)) {
        CGFloat cancelBtnX = 0;
        CGFloat cancelBtnY = height;
        CGFloat cancelBtnW = AlertWidth;
        CGFloat cancelBtnH = AlertBtnHeight;
        _cancelButton.frame = CGRectMake(cancelBtnX, cancelBtnY, cancelBtnW, cancelBtnH);
    }
    
    if ((!_cancelButton) && _commitButton) {
        CGFloat commitBtnX = 0;
        CGFloat commitBtnY = height;
        CGFloat commitBtnW = AlertWidth;
        CGFloat commitBtnH = AlertBtnHeight;
        _commitButton.frame = CGRectMake(commitBtnX, commitBtnY, commitBtnW, commitBtnH);
    }
    
    if (_cancelButton && _commitButton) {
        
        CGFloat cancelBtnX = 0;
        CGFloat cancelBtnY = height;
        CGFloat cancelBtnW = AlertWidth / 2;
        CGFloat cancelBtnH = AlertBtnHeight;
        _cancelButton.frame = CGRectMake(cancelBtnX, cancelBtnY, cancelBtnW, cancelBtnH);
        
        CGFloat commitBtnX = cancelBtnW;
        CGFloat commitBtnY = cancelBtnY;
        CGFloat commitBtnW = cancelBtnW;
        CGFloat commitBtnH = AlertBtnHeight;
        _commitButton.frame = CGRectMake(commitBtnX, commitBtnY, commitBtnW, commitBtnH);
        
        CGFloat verticalX = cancelBtnW;
        CGFloat verticalY = height + 13;
        CGFloat verticalW = 0.5;
        CGFloat verticalH = AlertBtnHeight - 26;
        _verticalLine.frame = CGRectMake(verticalX, verticalY, verticalW, verticalH);
    }
    
    if (_cancelButton || _commitButton) {
        CGFloat horizontalX = 0;
        CGFloat horizontalY = height;
        CGFloat horizontalW = AlertWidth;
        CGFloat horizontalH = 0.5;
        _horizontalLine.frame = CGRectMake(horizontalX, horizontalY, horizontalW, horizontalH);
        
        height += AlertBtnHeight;
    }
    
    self.alertView.frame = CGRectMake(0, 0, AlertWidth, height);
    self.alertView.center = self.center;
    
}

+ (AlertAppearance *)appearances{
    
    static AlertAppearance* appearance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appearance = [[AlertAppearance alloc] init];
    });
    
    return appearance;
}

- (void)setShowAnimation{
    switch ([CustomAlertView appearances].KSAlertAnimationStyle) {
        case AlertAnimationStyleDefault:
        {
            CGPoint startPoint = CGPointMake(self.center.x, -_alertView.frame.size.height);
            _alertView.layer.position = startPoint;
            
            [UIView animateWithDuration:.8 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                _alertView.layer.position=self.center;
                
            } completion:^(BOOL finished) {
                
                if (_druation) {
                    [UIView animateWithDuration:.25 delay:_druation options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        self.alpha = 0;
                    } completion:^(BOOL finished) {
                        [self dismiss];
                    }];
                }
            }];
        }
            break;
    }
}

// 标题, 消息1,自动消失
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 druation:(NSTimeInterval)druation{
    
    CustomAlertView* alertView = [[CustomAlertView alloc] initWithTitle:title message1:message1 cancelButton:nil commitButton:nil commitAction:NULL druation:druation];
    
    [alertView show];
}

// 标题, 消息1,取消按钮
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 cancelButton:(NSString*)cancelTitle{
    
    CustomAlertView* alertView = [[CustomAlertView alloc] initWithTitle:title message1:message1 cancelButton:cancelTitle commitButton:nil commitAction:NULL  druation:0];
    
    [alertView show];
}

// 标题, 消息1,取消按钮,确定按钮
+ (void)showWithTitle:(NSString*)title message1:(NSString*)message1 cancelButton:(NSString*)cancelTitle customButton:(NSString*)commitTitle commitAction:(CommitAction)commitAction{
    
    CustomAlertView* alertView = [[CustomAlertView alloc] initWithTitle:title message1:message1 cancelButton:cancelTitle commitButton:commitTitle commitAction:commitAction druation:0];
    
    [alertView show];
}

// 标题, 消息1,取消按钮,确定按钮(给定默认按钮样式)
+ (void)showWithTitle:(NSString *)title message1:(NSString *)message1 cancelButton:(NSString *)cancelTitle commitType:(AlertViewButtonType )type commitAction:(CommitAction)commitAction{
    
    NSString* commitTitle = (type == 0)?@"确定":@"删除";
    
    CustomAlertView* alertView = [[CustomAlertView alloc] initWithTitle:title message1:message1 cancelButton:cancelTitle commitButton:commitTitle commitAction:commitAction druation:0];
    
    [alertView show];
}

@end


@implementation UIButton (block)

static char overviewKey;

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(CommitAction)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    CommitAction block = (CommitAction)objc_getAssociatedObject(self, &overviewKey);
    
    if (block) {
        __weak typeof(self) weakSelf = self;
        block(weakSelf);
    }
}

@end
