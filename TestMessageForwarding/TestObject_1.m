//
//  TestObject_1.m
//  TestMessageForwarding
//
//  Created by skytoup on 2018/5/8.
//  Copyright © 2018 skytoup. All rights reserved.
//

#import "TestObject_1.h"

@implementation TestObject_1

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id ret = [[TestObject alloc] init];
    NSLog(@"-->> %@ %p forwardingTargetForSelector: %@, return: %@", [self class], self, NSStringFromSelector(aSelector), ret);
    return ret;
}

- (void)testObject_1ExistsMethod {
    NSLog(@"-->> %@ %p I am exists", [self class], self);
}

@end
