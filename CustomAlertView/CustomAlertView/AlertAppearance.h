//
//  AlertAppearance.h
//  CustomAlertView
//
//  Created by 张丁豪 on 16/9/18.
//  Copyright © 2016年 张丁豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]

typedef NS_ENUM(NSUInteger, AlertAnimationStyles) {
    AlertAnimationStyleDefault,
};

@interface AlertAppearance : NSObject

// alertView
@property (nonatomic,strong) UIColor* AlertMaskViewColor;
@property (nonatomic,strong) UIColor* AlertViewColor;
@property (nonatomic, assign) UIEdgeInsets AlertViewPadding;
@property (nonatomic,assign) CGFloat AlertViewCornerRadius;

// title
@property (nonatomic,strong) NSDictionary<NSString *, id> * AlertTitleAttributed;

// message1
@property (nonatomic,assign) CGFloat AlertMessage1TopMargin;
@property (nonatomic,strong) NSDictionary<NSString *, id> * AlertMessage1Attributed;

// cancelTitle
@property (nonatomic,assign) CGFloat AlertCancelTitleTopMargin;
@property (nonatomic,strong) NSDictionary<NSString *, id> * AlertCancelTitleAttributed;

// customButton
@property (nonatomic,strong) NSDictionary<NSString *, id> * AlertCustomTitleAttributed;

// commitButton
@property (nonatomic,strong) NSDictionary<NSString *, id> * AlertCommitTitleAttributed;

// deleteButton
//@property (nonatomic,strong) NSDictionary<NSString *, id> * KSAlertDeleteTitleAttributed;


// line
@property (nonatomic,strong) UIColor* horizontalLineColor;
@property (nonatomic,strong) UIColor* verticalLineColor;

// Animation
@property (nonatomic, assign) AlertAnimationStyles KSAlertAnimationStyle;

@end
