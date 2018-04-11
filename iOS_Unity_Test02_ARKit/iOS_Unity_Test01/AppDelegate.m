//
//  AppDelegate.m
//  iOS_Unity_Test01
//
//  Created by willwei on 17/3/2.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import "YCAppController.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)unityWindow {
    return UnityGetMainWindow();
}

- (UIView *)unityView {
    return UnityGetGLView();
}

- (UIViewController *)unityViewController {
    return UnityGetGLViewController();
}

//- (UnityAppController *)unityAppController {
//    return GetAppController();
//}

- (void)showUnityWindow {
    [self.unityWindow makeKeyAndVisible];
    UnityPause(false);
}

- (void)hideUnityWindow {
    [self.window makeKeyAndVisible];
    UnityPause(true);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    // tabbar
//    self.tabBarController = [[UITabBarController alloc] init];
//    // 01
//    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    UINavigationController *navController01 = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    navController01.tabBarItem.title = @"Home";
//    [self.tabBarController addChildViewController:navController01];
//    // 02
//    UIViewController *vc = [[UIViewController alloc] init];
//    UINavigationController *navController02 = [[UINavigationController alloc] initWithRootViewController:vc];
//    navController02.tabBarItem.title = @"Other";
//    [self.tabBarController addChildViewController:navController02];
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = self.tabBarController;
//    [self.window makeKeyAndVisible];
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    TestViewController *vc = [[TestViewController alloc] init];
//    self.window.rootViewController = vc;
//
//    _unityAppController = [[UnityAppController alloc] init];
//    [_unityAppController application:application didFinishLaunchingWithOptions:launchOptions];
//
//    [self.window makeKeyAndVisible];
    
//    _unityController = [[YCAppController alloc] init];
//    [_unityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    /*
    // tabbar
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // 01
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *navController01 = [[UINavigationController alloc] initWithRootViewController:homeVC];
    navController01.tabBarItem.title = @"Home";
    [tabBarController addChildViewController:navController01];
    
    // 02
    UIViewController *vc = [[UIViewController alloc] init];
    UINavigationController *navController02 = [[UINavigationController alloc] initWithRootViewController:vc];
    navController02.tabBarItem.title = @"Other";
    [tabBarController addChildViewController:navController02];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    */
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [_unityAppController applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [_unityAppController applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [_unityAppController applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [_unityAppController applicationDidBecomeActive:application];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [_unityAppController applicationWillTerminate:application];
}


@end
