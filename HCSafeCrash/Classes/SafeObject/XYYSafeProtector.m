//
//  XYYSafeProtector.m
//  BeanSproutsChannel
//
//  Created by 高洪成 on 2020/5/25.
//  Copyright © 2020 xyy. All rights reserved.
//

#import "XYYSafeProtector.h"

@implementation XYYSafeProtector
+(void)openSafeProtectorWithIsDebug:(BOOL)isDebug
{
//    #if TEST
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken,^{
//        [NSObject openSafeProtector];
//        [NSArray openSafeProtector];
//        [NSMutableArray openSafeProtector];
//        [NSDictionary openSafeProtector];
//        [NSMutableDictionary openSafeProtector];
//    });
//    #elif DEBUG
//    return;
//    #else
//    static dispatch_once_t onceToken;
//       dispatch_once(&onceToken,^{
//           [NSObject openSafeProtector];
//           [NSArray openSafeProtector];
//           [NSMutableArray openSafeProtector];
//           [NSDictionary openSafeProtector];
//           [NSMutableDictionary openSafeProtector];
//       });
//    #endif
    //debug 环境不打开
    if (isDebug) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken,^{
            [NSObject openSafeProtector];
            [NSArray openSafeProtector];
            [NSMutableArray openSafeProtector];
            [NSDictionary openSafeProtector];
            [NSMutableDictionary openSafeProtector];
        });
    }else{
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken,^{
                [NSObject openSafeProtector];
                [NSArray openSafeProtector];
                [NSMutableArray openSafeProtector];
                [NSDictionary openSafeProtector];
                [NSMutableDictionary openSafeProtector];
            });
    }
}
@end
