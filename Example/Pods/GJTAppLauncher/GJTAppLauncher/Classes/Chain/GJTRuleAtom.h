//
//  GJTRuleSyncAtom.h
//  AFNetworking
//
//  Created by kyson on 2021/3/6.
//

#import <Foundation/Foundation.h>
#import "GJTRuleSyncChainMacro.h"

NS_ASSUME_NONNULL_BEGIN

@interface GJTRuleAtom : NSObject

@property (nonatomic, strong) NSString *className;

@property (nonatomic, strong) NSString *selName;

@property (nonatomic, assign) BOOL *bMainThread;

@property (nonatomic, strong, nullable) GJTRuleAtom *next;

@property (nonatomic, copy,nullable) GJTRuleAtomHandleBlock handleBlock;


-(instancetype)initWithParams:(NSDictionary *) params;


@end

NS_ASSUME_NONNULL_END
