//
//  UIButton+Countdown.m
//  CHCountdown
//
//  Created by arnoldxiao on 16/1/6.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "UIButton+Countdown.h"

@implementation UIButton (Countdown)

- (void)startWithSeconds:(int)seconds {
    __block int timeout = seconds;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:@"发送验证码" forState:UIControlStateNormal];
                [self setUserInteractionEnabled:YES];
            });
        } else {
            int sec = timeout % (seconds + 1);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.layer.borderColor = [UIColor grayColor].CGColor;
                NSString *string = [NSString stringWithFormat:@"重新发送(%ds)", sec];
                NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:string];
                NSUInteger location = [string rangeOfString:@"("].location + 1;
                NSUInteger length = [string rangeOfString:@"s)"].location - location;
                NSRange range = NSMakeRange(location, length);
                [titleString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, string.length)];
                [titleString addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
                [self setAttributedTitle:titleString forState:UIControlStateNormal];
                [self setUserInteractionEnabled:NO];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
