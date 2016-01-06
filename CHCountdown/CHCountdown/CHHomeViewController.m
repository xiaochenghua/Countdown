//
//  CHHomeViewController.m
//  CHCountdown
//
//  Created by arnoldxiao on 16/1/6.
//  Copyright © 2016年 Personal. All rights reserved.
//

#import "CHHomeViewController.h"

@interface CHHomeViewController ()
@property (nonatomic, strong) UIButton *countdownButton;
@end

@implementation CHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.countdownButton];
    self.countdownButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.countdownButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:125]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.countdownButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-125]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.countdownButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:-200]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.countdownButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:35]];
}

- (void)countdownButtonPressed:(UIButton *)button {
    [button startWithSeconds:5];
    //  Other ..
}

- (UIButton *)countdownButton {
    if (!_countdownButton) {
        _countdownButton = [[UIButton alloc] init];
        _countdownButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countdownButton setTitle:kSendVerifyCode forState:UIControlStateNormal];
        [_countdownButton setTitleColor:kColor(orangeColor) forState:UIControlStateNormal];
        _countdownButton.layer.cornerRadius = 5;
        _countdownButton.layer.masksToBounds = YES;
        _countdownButton.layer.borderColor = kCGColor(orangeColor);
        _countdownButton.layer.borderWidth = 0.8;
        [_countdownButton addTarget:self action:@selector(countdownButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _countdownButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
