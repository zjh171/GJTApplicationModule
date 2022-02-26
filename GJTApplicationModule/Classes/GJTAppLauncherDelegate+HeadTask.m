//
//  GJTAppLauncherDelegate+HeadTask.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/4.
//

#import "GJTAppLauncherDelegate+HeadTask.h"
#import <GJTAppLauncher/GJTAppLauncher.h>

@implementation GJTAppLauncherDelegate(HeadTask)


@LauncherHeadTask(GJTAppLauncherDelegate,setupHotFix);
@LauncherHeadTask(GJTAppLauncherDelegate,setupDebugTool);


+(void)setupHotFix {
    
}

+(void)setupDebugTool {
    Class GJTDebugerManager = NSClassFromString(@"GJTDebugerManager");
    id debuger = [GJTDebugerManager performSelector:@selector(shareInstance)];
    [debuger performSelector:@selector(install)];
}

@end
