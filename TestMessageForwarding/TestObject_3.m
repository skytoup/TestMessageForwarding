//
//  TestObject_3.m
//  TestMessageForwarding
//
//  Created by skytoup on 2018/5/8.
//  Copyright © 2018 skytoup. All rights reserved.
//

#import "TestObject_3.h"

@implementation TestObject_3

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"-->> %@ %p methodSignatureForSelector: %@", [self class], self, NSStringFromSelector(aSelector));
    return [NSObject methodSignatureForSelector:@selector(init)];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"-->> %@ %p forwardInvocation: %@", [self class], self, anInvocation);
//    [super forwardInvocation:anInvocation]; // will crash, because the method signature is not right
}

@end
