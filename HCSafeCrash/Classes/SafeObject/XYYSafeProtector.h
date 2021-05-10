//
//  XYYSafeProtector.h
//  BeanSproutsChannel
//
//  Created by 高洪成 on 2020/5/25.
//  Copyright © 2020 xyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SafeObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYYSafeProtector : NSObject

+ (void)openSafeProtectorWithIsDebug:(BOOL)isDebug;

@end

NS_ASSUME_NONNULL_END
