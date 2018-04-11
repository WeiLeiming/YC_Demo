//
//  TestViewController.m
//  iOS_Unity_Test01
//
//  Created by willwei on 17/3/2.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

#import "TestViewController.h"
#import "AppDelegate.h"
#import <WebKit/WebKit.h>
#import "YCWebView.h"
#import "UnityAppController.h"
#import "UnityAppController+ViewHandling.h"
#import "UnityView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 50, 100, 100);
    [button setTitle:@"跳转到Unity" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(iosToUnityButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)iosToUnityButtonClicked:(UIButton *)sender {
    NSLog(@"跳转到Unity");
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [appDelegate showUnityWindow];
    
    for (UIView *view in appDelegate.unityWindow.subviews) {
        NSLog(@"%@", view);
    }
    
    // 在Unity中添加视图
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIView *unityView = appDelegate.unityView;
        // webView测试
//        WKWebView *webView = [[WKWebView alloc] initWithFrame:unityView.frame];
//        webView.backgroundColor = [UIColor clearColor];
//        [unityView addSubview:webView];
//        NSURL *url = [[NSURL alloc] initWithString:@"https://www.baidu.com/"];
//        NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
//        [webView loadRequest:request];
        // 添加退出按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(50, 50, 100, 100);
        [button setTitle:@"退出Unity" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(quitUnityBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [unityView addSubview:button];
        // 添加打开webView按钮
        UIButton *webViewBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        webViewBtn.frame = CGRectMake(50, 200, 100, 100);
        [webViewBtn setTitle:@"显示webView" forState:UIControlStateNormal];
        [webViewBtn addTarget:self action:@selector(showWebViewBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [unityView addSubview:webViewBtn];
    });
}

- (void)quitUnityBtnClicked:(UIButton *)sender {
    NSLog(@"退出Unity");
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate hideUnityWindow];
}

- (void)showWebViewBtnClicked:(UIButton *)sender {
    NSLog(@"显示webView");
    YCWebView *webview = [[YCWebView alloc] init];
    [webview show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
