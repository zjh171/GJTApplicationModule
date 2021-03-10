//
//  GJTAppLauncherAnnotation.m
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/3.
//

#import "GJTAppLauncherAnnotation.h"
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <mach-o/ldsyms.h>
#include <dlfcn.h>
#import <objc/runtime.h>
#import <objc/message.h>

#ifndef __LP64__
#define mach_header mach_header
#else
#define mach_header mach_header_64
#endif

static const struct mach_header *mph = NULL;
extern const struct mach_header _mh_execute_header;

NSArray<NSString *>* load_config_by_secname(const char *sectionName) {
    NSMutableArray *configs = [[NSMutableArray alloc] init];
    mph = &_mh_execute_header;
    if (mph == NULL) {
        Dl_info info;
        dladdr(load_config_by_secname, &info);
        mph = (struct mach_header*)info.dli_fbase;
    }

    if (mph == NULL) {
        return nil;
    }

    unsigned long size = 0;
    uintptr_t *sectionList = (uintptr_t*)getsectiondata(mph, kLauncherSeg, sectionName, &size);

    unsigned long cByte = size/sizeof(void*);
    for (int idx = 0; idx < cByte; ++idx) {
        char *cSection = (char*)sectionList[idx];
        NSString *nsSection = [NSString stringWithUTF8String:cSection];
        if(!nsSection)continue;
        [configs addObject:nsSection];
    }
    return configs;
}
