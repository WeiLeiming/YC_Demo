//
//  ViewController.m
//  UnityWebGLDemo
//
//  Created by yichen on 2018/3/21.
//  Copyright © 2018年 vDesign. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"Webgl"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    WKWebView *webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:webView];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:webView];
    
    [webView loadRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
