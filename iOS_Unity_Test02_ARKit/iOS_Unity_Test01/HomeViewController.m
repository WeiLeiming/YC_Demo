//
//  HomeViewController.m
//  iOS_Unity_Test01
//
//  Created by yichen on 2018/4/8.
//  Copyright © 2018年 qj-vr. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "UnityAppController.h"
#import "UnityView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Home";
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"详情" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(detailBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UnityAppController *appDelegate = (UnityAppController *)[UIApplication sharedApplication].delegate;
    CGRect frame = CGRectMake(50, 150, 200, 200);
    appDelegate.unityView.frame = frame;
    [self.view addSubview:appDelegate.unityView];
}

- (void)detailBtnClicked:(UIButton *)sender {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
