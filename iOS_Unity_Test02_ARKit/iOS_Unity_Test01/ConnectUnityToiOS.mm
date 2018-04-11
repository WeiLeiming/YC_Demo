//
//  ConnectUnityToiOS.m
//  iOS_Unity_Test01
//
//  Created by 魏雷鸣 on 2018/3/15.
//  Copyright © 2018年 ycvr. All rights reserved.
//

#import "ConnectUnityToiOS.h"
#import "YCWebView.h"

@implementation ConnectUnityToiOS

static ConnectUnityToiOS *_instance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ConnectUnityToiOS alloc] init];
    });
    return _instance;
}

- (void)showWebView {
    YCWebView *webview = [[YCWebView alloc] init];
    [webview show];
}

@end

extern "C" {
    
    void showWebView() {
        [[ConnectUnityToiOS sharedInstance] showWebView];
    }
    
} // extern "C"
