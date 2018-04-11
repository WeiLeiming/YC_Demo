//
//  AppDelegate.h
//  iOS_Unity_Test01
//
//  Created by willwei on 17/3/2.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnityAppController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIWindow *unityWindow;
@property (strong, nonatomic) UIView *unityView;
@property (strong, nonatomic) UIViewController *unityViewController;
@property (strong, nonatomic) UnityAppController *unityAppController;

@property (strong, nonatomic) UITabBarController *tabBarController;

- (void)showUnityWindow;
- (void)hideUnityWindow;

@end

