//
//  GJTAppLauncherItems.h
//  GJTAppLauncher
//
//  Created by kyson on 2021/3/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJTAppLauncherItems : NSObject

@property (nonatomic, strong) NSArray *heads;
@property (nonatomic, strong) NSArray *tails;

+(instancetype) loadLauncherAnnotation ;


@end

NS_ASSUME_NONNULL_END
