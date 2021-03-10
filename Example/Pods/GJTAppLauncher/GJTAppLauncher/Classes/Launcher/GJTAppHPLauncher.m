//
//  GJTAppLauncherDelegate.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/4.
//

#import "GJTAppHPLauncher.h"
#import "GJTAppLauncherItems.h"
#import "GJTRuleSyncChain.h"
#import "GJTRuleSyncChain+RuleSyncAtom.h"

@interface GJTAppHPLauncher ()

@property (nonatomic, strong) NSDictionary *launchOptions;
@property (nonatomic, strong) GJTAppLauncherItems *items;
@property (nonatomic, strong) GJTRuleSyncChain *ruleSyncChain;

@end

@implementation GJTAppHPLauncher


+(instancetype) sharedInstance {
    static GJTAppHPLauncher *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[GJTAppHPLauncher alloc] init];
    });
    return shareInstance;
}


-(void) appLaunchOptions:(NSDictionary *) launchOptions {
    if (![launchOptions isKindOfClass:NSDictionary.class]) {
        return;
    }
    [GJTAppHPLauncher sharedInstance].launchOptions = launchOptions;
}

-(void) loadLauncherAnnotation {
    self.items = [GJTAppLauncherItems loadLauncherAnnotation];
}


-(void) appDidFinishLaunching {
    [self loadLauncherAnnotation];
    
    [self runLauncherTask:self.items.heads tails:self.items.tails];
    
}

- (void)runLauncherTask:(NSArray *)headers tails:(NSArray *)tails {
    self.ruleSyncChain = [GJTRuleSyncChain syncChainWithChainHeaders:headers chainTails:tails handleAtomBlock:^NSException *(GJTRuleAtom *atom) {
        __block NSException *exception = nil;
        
        Class cls = NSClassFromString(atom.className);
        SEL sel = NSSelectorFromString(atom.selName);
        if ([cls respondsToSelector:sel]) {
            ((void (*) (id,SEL)) [cls methodForSelector:sel])(cls,sel);
        } else {
            NSString *reason = [NSString stringWithFormat:@"class: %@ doesnot respondsToSelector: %@",cls,NSStringFromSelector(sel)];
            exception = [self generateLaunchException:reason];
        }
        
        return exception;
    }];
}

-(NSException *) generateLaunchException:(NSString *) reason {
    return [NSException exceptionWithName:@"GJTLauncher" reason:reason userInfo:nil];
}


@end
