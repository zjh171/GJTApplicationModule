//
//  GJTAppLauncherDelegate+TailTask.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/8.
//

#import "GJTAppLauncherDelegate+TailTask.h"
#import <GJTAppLauncher/GJTAppLauncher.h>
#import <GJTMvvmKit/GJTMvvmKit.h>

@class GJTMineViewController;

@implementation GJTAppLauncherDelegate(TailTask)


@LauncherTailTask(GJTAppLauncherDelegate,setupHomeViewController);


+(void) setupHomeViewController {
    
    Class targetClass = NSClassFromString(@"GJTMineViewController");
    id mineVC = [[targetClass alloc] init];
    GJTNavigationController *navc4 = [[GJTNavigationController alloc] initWithRootViewController:mineVC];
    UITabBarController *tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = @[navc4];

    UIWindow *rootWindow = ((GJTAppLauncherDelegate *)([UIApplication sharedApplication].delegate)).window;
    rootWindow.rootViewController = tabController;
    [rootWindow makeKeyAndVisible];
}

@end
