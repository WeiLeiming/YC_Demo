//
//  DetailViewController.m
//  iOS_Unity_Test01
//
//  Created by yichen on 2018/4/8.
//  Copyright © 2018年 qj-vr. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "UnityAppController.h"
#import "UnityView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Detail";
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UnityAppController *appDelegate = (UnityAppController *)[UIApplication sharedApplication].delegate;
//    [appDelegate.unityAppController startUnity:UIApplication.sharedApplication];
    CGRect frame = CGRectMake(50, 150, 200, 200);
    appDelegate.unityView.frame = frame;
    [self.view addSubview:appDelegate.unityView];
}

- (IBAction)nextBtnClicked:(UIButton *)sender {
    UnityAppController *appDelegate = (UnityAppController *)[UIApplication sharedApplication].delegate;
    CGRect frame = CGRectMake(0, 150, 300, 300);
    appDelegate.unityView.frame = frame;
}

@end
