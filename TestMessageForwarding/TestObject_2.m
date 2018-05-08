//
//  TestObject_2.m
//  TestMessageForwarding
//
//  Created by skytoup on 2018/5/8.
//  Copyright © 2018 skytoup. All rights reserved.
//

#import "TestObject_2.h"
#import "TestObject_1.h"

@implementation TestObject_2

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id ret = [[TestObject_1 alloc] init];
    NSLog(@"-->> %@ %p forwardingTargetForSelector: %@, return: %@", [self class], self, NSStringFromSelector(aSelector), ret);
    return ret;
}

@end
