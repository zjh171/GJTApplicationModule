//
//  GJTAppLauncherAnnotation.h
//  GJTApplicationModule
//
//  Created by kyson on 2021/3/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#if defined(__has_feature)
#if __has_feature(address_sanitizer)
// code that builds only under AddressSanitizer
#define kLauncherSeg   SEG_OBJC
#ifndef kLaucherSegData
#define kLaucherSegData(sectName) __attribute((used, section("__OBJC,"#sectName" ")))
#endif

#else

#define kLauncherSeg   SEG_DATA
#ifndef kLaucherSegData
/**
 修饰一个变量，存储在segment:DATA-section:#sectName中。used表示即使该变量未使用到，也要存储
 网络上搜索“__attribute__ used section iOS简单应用”获取更多信息
 */

#define kLaucherSegData(sectName) __attribute((used, section("__DATA,"#sectName" ")))
#endif

#endif
#endif /* defined(__has_feature) */

#define GJTSelKey            @"selector"
#define GJTClsNameKey        @"class"
#define GJTTypeKey           @"type"
#define GJTPriorityKey       @"priority"
#define GJTThreadKey         @"tread"

#ifndef GJTLauncherAnnotation

    #define GJTLSectionName       GJTLSectionName
    #define GJTLaucherSecNameKey  "GJTLSectionName"

    //启动阶段头启动任务声明
    #define LauncherHeadTask(cls,selector) GJTLauncherAnnotation(head, selector, cls, v, priority)
    #define LauncherTailTask(cls,selector) GJTLauncherAnnotation(tail, selector, cls, v, priority)

    #define GJTLauncherAnnotation(type, selector, cls, thread, priority) class GJTAppHPLauncher; char * k##type##selector##_annotation##cls kLaucherSegData(GJTLSectionName) = "{ \"type\" : \""#type"\", \"selector\" :\""#selector"\", \"class\" : \""#cls"\", \"tread\" :\""#thread"\", \"priority\" :\""#priority"\"}";

#endif

extern NSArray<NSString *>* load_config_by_secname(const char *sectionName);



NS_ASSUME_NONNULL_END
