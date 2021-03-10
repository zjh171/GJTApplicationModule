//
//  GJTRuleSyncChain.h
//  AFNetworking
//
//  Created by kyson on 2021/3/6.
//

#import <Foundation/Foundation.h>
#import "GJTRuleAtom.h"

NS_ASSUME_NONNULL_BEGIN

@interface GJTRuleSyncChain : NSObject

+(instancetype) syncChainWithChainHeaders:(NSArray *) headeAtoms chainTails:(NSArray *) tailAtoms handleAtomBlock:(GJTRuleAtomHandleBlock) handleBlock;

@end

NS_ASSUME_NONNULL_END
