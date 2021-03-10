//
//  GJTAppHPLauncher.h
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJTAppHPLauncher : NSObject

+(instancetype) sharedInstance ;

-(void) appLaunchOptions:(NSDictionary *) launchOptions;

-(void) appDidFinishLaunching ;

@end

NS_ASSUME_NONNULL_END
