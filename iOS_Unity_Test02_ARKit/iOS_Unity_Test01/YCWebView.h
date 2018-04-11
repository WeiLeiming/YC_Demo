//
//  YCWebView.h
//  iOS_Unity_Test01
//
//  Created by 魏雷鸣 on 2018/3/14.
//  Copyright © 2018年 ycvr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCWebView : UIView

@property (nonatomic, strong) NSURL *url;

- (void)show;

@end
