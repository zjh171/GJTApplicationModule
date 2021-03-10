//
//  GJTAppLauncherItems.m
//  GJTAppLauncher
//
//  Created by kyson on 2021/3/3.
//

#import "GJTAppLauncherItems.h"
#import "GJTAppLauncherAnnotation.h"

@implementation GJTAppLauncherItems

+(instancetype) loadLauncherAnnotation {
    GJTAppLauncherItems *items = [[GJTAppLauncherItems alloc] init];
    [GJTAppLauncherItems loadLauncherAnnotation:items];
    return items;
}


+(void) loadLauncherAnnotation:(GJTAppLauncherItems *) items {
    NSArray <NSString *> * annotations = nil;
    annotations = load_config_by_secname(GJTLaucherSecNameKey);
    
    if (0 == annotations.count) {
        return;
    }
    
    NSMutableArray *heads = nil;
    NSMutableArray *tails = nil;

    
    for (NSString *item in annotations) {
        NSData *jsonData = [item dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error = nil;
        id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error == nil && [json isKindOfClass:NSDictionary.class]) {
            NSDictionary *aConfig = (NSDictionary *) json;
            NSString *type = [aConfig objectForKey:GJTTypeKey];
            
            if ([type isEqualToString:@"head"]) {
                if (nil == heads) {
                    heads = [[NSMutableArray alloc] init];
                }
                [heads addObject:aConfig];
            }
            
            if ([type isEqualToString:@"tail"]) {
                if (nil == tails) {
                    tails = [[NSMutableArray alloc] init];
                }
                [tails addObject:aConfig];
            }
        }
        
    }
    items.heads = heads;
    items.tails = tails;
    
}


@end
