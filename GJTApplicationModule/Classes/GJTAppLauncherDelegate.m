//
//  GJTAppLauncherDelegate.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/3.
//

#import "GJTAppLauncherDelegate.h"
#import <GJTAppLauncher/GJTAppLauncher.h>

@interface GJTAppLauncherDelegate ()

@end


@implementation GJTAppLauncherDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    [[GJTAppHPLauncher sharedInstance] appLaunchOptions:launchOptions];
    
    [[GJTAppHPLauncher sharedInstance] appDidFinishLaunching];
    
    return YES;
}



@end
