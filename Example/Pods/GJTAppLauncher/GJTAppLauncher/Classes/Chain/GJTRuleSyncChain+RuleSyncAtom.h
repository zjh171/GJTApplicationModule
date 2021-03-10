//
//  GJTRuleSyncChain+RuleSyncAtom.h
//  GJTAppLauncher
//
//  Created by kyson on 2021/3/6.
//

#import <Foundation/Foundation.h>
#import "GJTRuleSyncChain.h"
#import "GJTRuleAtom.h"

NS_ASSUME_NONNULL_BEGIN

@interface GJTRuleSyncChain(RuleSyncAtom)

@property (nonatomic, strong) GJTRuleAtom *atomsChainHeads;

@property (nonatomic, strong) GJTRuleAtom *atomsChainTails;


-(GJTRuleAtom *) generateSyncChainWithAtoms:(NSArray *) syncAtoms handleAtomBlock:(GJTRuleAtomHandleBlock) atomHandleBlock;



-(void) runSyncHeadsAtom ;

-(void) runSyncTailAtom ;

@end

NS_ASSUME_NONNULL_END
