//
//  GJTRuleSyncAtom.m
//  AFNetworking
//
//  Created by kyson on 2021/3/6.
//

#import "GJTRuleAtom.h"
#import "GJTAppLauncherAnnotation.h"

@implementation GJTRuleAtom


-(instancetype)initWithParams:(NSDictionary *) params {
    if (params.count <= 0) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _selName = params[GJTSelKey];
        _className = params[GJTClsNameKey];
    }
    return self;
}



@end
