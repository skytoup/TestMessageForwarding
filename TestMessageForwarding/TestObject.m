//
//  TestObject.m
//  TestMessageForwarding
//
//  Created by skytoup on 2018/5/8.
//  Copyright © 2018 skytoup. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

+ (BOOL)resolveClassMethod:(SEL)sel {
    BOOL ret = [super resolveClassMethod:sel];
    NSLog(@"-->> %@ %p resolveClassMethod: %@, return: %d", [self class], self, NSStringFromSelector(sel), ret);
    return ret;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL ret = [super respondsToSelector:aSelector];
    NSLog(@"-->> %@ %p respondsToSelector: %@, return: %d", [self class], self, NSStringFromSelector(aSelector), ret);
    return ret;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id ret = [super forwardingTargetForSelector:aSelector];
    NSLog(@"-->> %@ %p forwardingTargetForSelector: %@, return: %@", [self class], self, NSStringFromSelector(aSelector), ret);
    return ret;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature* ret = [super methodSignatureForSelector:aSelector];
    NSLog(@"-->> %@ %p methodSignatureForSelector: %@, return: %@", [self class], self, NSStringFromSelector(aSelector), ret);
    return ret;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"-->> %@ %p forwardInvocation: %@", [self class], self, anInvocation);
    [super forwardInvocation:anInvocation];
}

@end
