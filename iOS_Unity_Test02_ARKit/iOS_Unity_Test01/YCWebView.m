//
//  YCWebView.m
//  iOS_Unity_Test01
//
//  Created by 魏雷鸣 on 2018/3/14.
//  Copyright © 2018年 ycvr. All rights reserved.
//

#import "YCWebView.h"
#import <WebKit/WebKit.h>
#import <Masonry.h>

#define kWebViewAnimationDuration  0.5

@interface YCWebView()

@property (nonatomic, assign) UIInterfaceOrientation orientation;
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation YCWebView

#pragma mark - Initialization&Delloc
- (instancetype)init {
    if (self = [super init]) {
        [self setupSubView];
        [self setupConstraints];
        [self setupNotification];
        
        self.url = [[NSURL alloc] initWithString:@"https://www.baidu.com/"];
        [self loadRequest];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"webView dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Get
- (UIInterfaceOrientation)orientation {
    return [[UIApplication sharedApplication] statusBarOrientation];
}

#pragma mark - Notification
- (void)setupNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeRotate:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)changeRotate:(NSNotification *)noti {
    [self resetConstraints];
}

#pragma mark - UI
- (void)setupSubView {
    // self
    self.backgroundColor = [UIColor clearColor];
    // WKWebView
    self.webView = [[WKWebView alloc] init];
    [self addSubview:self.webView];
}

/**
 设置约束
 */
- (void)setupConstraints {
    if (self.orientation == UIInterfaceOrientationPortrait) {
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self setupPortraitConstraints];
    } else if (self.orientation == UIInterfaceOrientationLandscapeRight) {
        self.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self setupLandscapeConstraints];
    }
}

/**
 设置竖屏约束
 */
- (void)setupPortraitConstraints {
    // WKWwebView
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(100);
        make.left.right.bottom.mas_equalTo(self);
    }];
}

/**
 设置横屏约束
 */
- (void)setupLandscapeConstraints {
    // WKWwebView
    [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(100);
        make.top.right.bottom.mas_equalTo(self);
    }];
}

/**
 根据屏幕方向重置约束
 */
- (void)resetConstraints {
    if (self.orientation == UIInterfaceOrientationPortrait) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self setupPortraitConstraints];
    } else if (self.orientation == UIInterfaceOrientationLandscapeRight) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self setupLandscapeConstraints];
    }
}

#pragma mark - Show&Hide
- (void)showIn:(UIView *)view {
    NSAssert(view != nil, @"传入View不能为nil，可使用 - (void)show 替代");
    
    [view addSubview:self];
    [UIView animateWithDuration:kWebViewAnimationDuration animations:^{
        if (self.orientation == UIInterfaceOrientationPortrait) {
            CGRect tmpFrame = self.frame;
            tmpFrame.origin.y = 0;
            self.frame = tmpFrame;
        } else if (self.orientation == UIInterfaceOrientationLandscapeRight) {
            CGRect tmpFrame = self.frame;
            tmpFrame.origin.x = 0;
            self.frame = tmpFrame;
        }
    } completion:^(BOOL finished) {
        
    }];
}


/**
 显示视图
 */
- (void)show {
    [self showIn:kKeyWindow];
}


/**
 隐藏视图
 */
- (void)dismiss {
    [UIView animateWithDuration:kWebViewAnimationDuration animations:^{
        if (self.orientation == UIInterfaceOrientationPortrait) {
            CGRect tmpFrame = self.frame;
            tmpFrame.origin.y = SCREEN_HEIGHT;
            self.frame = tmpFrame;
        } else if (self.orientation == UIInterfaceOrientationLandscapeRight) {
            CGRect tmpFrame = self.frame;
            tmpFrame.origin.x = SCREEN_WIDTH;
            self.frame = tmpFrame;
        }
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Load URL
- (void)loadRequest {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: self.url];
    [self.webView loadRequest:request];
}

#pragma mark - Touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

@end
