# CustomAlertView
自定义AlertView，可以根据需要展示一个按钮或者两个按钮

使用非常方便

1.导入对应头文件 

```Objective-C
#import "CustomAlertView.h"
```

2.调用对应方法

```Objective-C
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
```

实现效果 ：

![](https://github.com/CalvinCheungCoder/CustomAlertView/blob/master/CustomAlertView.gif)

参考:[KSAlertView](https://github.com/18301125620/KSAlertView)
