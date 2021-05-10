//
//  NSObject+Safe.m
//  FBSnapshotTestCase
//
//  Created by 高洪成 on 2020/4/23.
//

#import "NSObject+Safe.h"
//#import "XYYSafeProtector.h"
#import "NSObject+Swizzling.h"

@interface XYYSafeProxy:NSObject
@property (nonatomic,strong) NSException *exception;
@property (nonatomic,weak) id safe_object;
@end
@implementation XYYSafeProxy
-(void)safe_crashLog{
}
@end

@implementation NSObject (Safe)

+(void)openSafeProtector
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        
        if ([NSStringFromClass([NSObject class]) isEqualToString:@"NSObject"]) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [self exchangeInstanceMethodWithSelfClass:self
                                             originalSelector:@selector(methodSignatureForSelector:)                      swizzledSelector:@selector(safe_methodSignatureForSelector:)];
                [self exchangeInstanceMethodWithSelfClass:self
                originalSelector:@selector(forwardInvocation:)                     swizzledSelector:@selector(safe_forwardInvocation:)];
                
            });
        }else{
            //只有NSObject 能调用openSafeProtector其他类调用没效果
        }
    });
}
- (NSMethodSignature *)safe_methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *ms = [self safe_methodSignatureForSelector:aSelector];
    if ([self respondsToSelector:aSelector] || ms){
        return ms;
    }
    else{
        return [XYYSafeProxy instanceMethodSignatureForSelector:@selector(safe_crashLog)];
    }
}
- (void)safe_forwardInvocation:(NSInvocation *)anInvocation{
    @try {
        [self safe_forwardInvocation:anInvocation];
    } @catch (NSException *exception) {
        NSLog(@"exception%@,anInvocation%@",exception,anInvocation);
    } @finally {
    }
}
@end
