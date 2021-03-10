//
//  GJTAppLauncherDelegate+TailTask.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/8.
//

#import "GJTAppLauncherDelegate+TailTask.h"
#import <GJTAppLauncher/GJTAppLauncher.h>

//#import <GJTMineModule/GJTMineModule.h>
//#import <GJTMomentModule/GJTDiscoveryViewController.h>
//#import <GJTGroupModule/GJTHomeViewController.h>
//#import <GJTMvvmKit/GJTMvvmKit.h>


@implementation GJTAppLauncherDelegate(TailTask)


@LauncherTailTask(GJTAppLauncherDelegate,setupHomeViewController);


+(void) setupHomeViewController {
    
//    GJTMineViewController *mineVC = [[GJTMineViewController alloc] init];
//    GJTDiscoveryViewController *discoveryVC = [[GJTDiscoveryViewController alloc] init];
//    GJTHomeViewController *homeVC = [[GJTHomeViewController alloc] init];
//
//    GJTNavigationController *navc1 = [[GJTNavigationController alloc] initWithRootViewController:homeVC];
//    GJTNavigationController *navc2 = [[GJTNavigationController alloc] initWithRootViewController:discoveryVC];
//
//    GJTNavigationController *navc4 = [[GJTNavigationController alloc] initWithRootViewController:mineVC];
//
//    UITabBarController *tabController = [[UITabBarController alloc] init];
//    tabController.viewControllers = @[navc1,navc2,navc4];
//
//    UIWindow *rootWindow = ((GJTAppLauncherDelegate *)([UIApplication sharedApplication].delegate)).window;
//    rootWindow.rootViewController = tabController;
//
//    [rootWindow makeKeyAndVisible];
}

@end
