//
//  YCAppController.m
//  iOS_Unity_Test01
//
//  Created by yichen on 2018/3/21.
//  Copyright © 2018年 ycvr. All rights reserved.
//

#import "YCAppController.h"
#import <UIKit/UIKit.h>
#import "UnityAppController.h"
#import "UI/UnityView.h"
#import "UI/UnityViewControllerBase.h"
#import "TestViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@interface YCAppController ()

@property (nonatomic, strong) AppDelegate *delegate;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation YCAppController

- (void)willStartWithViewController:(UIViewController *)controller {
    /*----------------------------------------------------------------------------------------------------------*/
    // tabbar
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    // 01
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *navController01 = [[UINavigationController alloc] initWithRootViewController:homeVC];
    navController01.tabBarItem.title = @"Home";
    [tabBarController addChildViewController:navController01];
    // 02
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor orangeColor];
    UINavigationController *navController02 = [[UINavigationController alloc] initWithRootViewController:vc];
    navController02.tabBarItem.title = @"Other";
    [tabBarController addChildViewController:navController02];
    /*----------------------------------------------------------------------------------------------------------*/
    // 新建自定义视图控制器。
//    TestViewController *testVC = [[TestViewController alloc] init];
    /*----------------------------------------------------------------------------------------------------------*/
    // 把Unity的内容视图作为子视图放到我们自定义的视图里面。
//    [viewController.view addSubview:_unityView];
//    [_unityView setFrame:CGRectMake(100, 200, 200, 200)];
    /*----------------------------------------------------------------------------------------------------------*/
//    UIStoryboard *storyBoard    = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *mainVC    = [storyBoard instantiateInitialViewController];
//
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = mainVC;
//
//    _rootController             = [self.window rootViewController];
//    _rootView                   = _rootController.view;
    /*----------------------------------------------------------------------------------------------------------*/
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    _rootController         = [[UnityDefaultViewController alloc] init];
    _rootView               = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _rootController.view    = _rootView;

    UIViewController *mainVC       = [storyBoard instantiateViewControllerWithIdentifier:@"idMainViewController"];
    mainVC.navigationItem.title = @"Home";
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];

    [_rootView addSubview:self.navigationController.view];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = _rootController;
    /*----------------------------------------------------------------------------------------------------------*/
    // 把根视图和控制器全部换成我们自定义的内容。
//    _rootController = testVC;
//    _rootView = _rootController.view;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AppDelegate *delegate = [AppDelegate alloc];
    BOOL launchBool;
    launchBool = [delegate application:application didFinishLaunchingWithOptions:launchOptions];
    launchBool = [super application:application didFinishLaunchingWithOptions:launchOptions];

    return launchBool;
}

@end

// 允许子类化 UnityAppController
IMPL_APP_CONTROLLER_SUBCLASS(YCAppController)
