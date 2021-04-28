//
//  GJTAppLauncherDelegate+TailTask.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/8.
//

#import "GJTAppLauncherDelegate+TailTask.h"
#import <GJTAppLauncher/GJTAppLauncher.h>
#import <GJTGojitoMvvmKit/GJTGojitoMvvmKit.h>

@class GJTMineViewController;

@implementation GJTAppLauncherDelegate(TailTask)


@LauncherTailTask(GJTAppLauncherDelegate,setupHomeViewController);


+(void) setupHomeViewController {
    
    Class homeTargetClass = NSClassFromString(@"GJTAPPViewController");
    id homeVC = [[homeTargetClass alloc] init];
    GJTNavigationController *homeNavc1 = [[GJTNavigationController alloc] initWithRootViewController:homeVC];
    
    Class targetClass = NSClassFromString(@"GJTAPPViewController");
    id mineVC = [[targetClass alloc] init];
    GJTNavigationController *navc4 = [[GJTNavigationController alloc] initWithRootViewController:mineVC];
    UITabBarController *tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = @[homeNavc1,navc4];

    UIWindow *rootWindow = ((GJTAppLauncherDelegate *)([UIApplication sharedApplication].delegate)).window;
    rootWindow.rootViewController = tabController;
    [rootWindow makeKeyAndVisible];
}

@end
