//
//  UIButton+Countdown.h
//  CHCountdown
//
//  Created by arnoldxiao on 16/1/6.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Countdown)

/**
 *  倒计时
 *
 *  @param title    按钮title
 *  @param sec      倒计时时间，单位为s
 *  @param color    按钮backgroundColor
 *  @param subTitle 倒计时中的按钮子标题（时间后）
 *  @param cColor   倒计时中的按钮backgroundColor
 */
- (void)startWithSeconds:(int)seconds;

@end
