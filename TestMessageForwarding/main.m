//
//  main.m
//  TestMessageForwarding
//
//  Created by skytoup on 2018/5/8.
//  Copyright © 2018 skytoup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"
#import "TestObject_1.h"
#import "TestObject_2.h"
#import "TestObject_3.h"

void test_0() {
    // test: call exists method
    // retult: not thing log
    // summary: message forwarding does not occur in the method where the call exists
    [[TestObject alloc] init];
}

void test_1() {
    // test: call not exists method
    // result: call forwardingTargetForSelector:(return nil), call methodSignatureForSelector:(return nil), and log 'unrecognized selector sent to instance'
    // summary: message forwarding occurs in a method that does not exist
    TestObject* obj = [[TestObject alloc] init];
    [obj performSelector:NSSelectorFromString(@"not exists sel")];
}

void test_2() {
    // test: TestObject_1 override the method 'forwardingTargetForSelector:' and return a TestObject instance, and than call a method where them both not exists
    // result: first, TestObject_1 instance call forwardingTargetForSelector:(return: TestObject instance), and then TestObject instance call forwardingTargetForSelector:(return nil), call methodSignatureForSelector:(return nil), and log 'unrecognized selector sent to instance'
    // summary: unrecognized selector are forwarding to other objects
    TestObject_2* obj = [[TestObject_2 alloc] init];
    [obj performSelector:NSSelectorFromString(@"not exists sel")];
}

void test_3() {
    // test: TestObject_2 override the method 'forwardingTargetForSelector:' and return a TestObject_1 instance, and than call a method where not exist in TestObject_2 and exists in TestObject_1
    // result: first, TestObject_2 install call forwardingTargetForSelector:(return: TestObject_1 instance), and than call the -[TestObject_1 testObject_1ExistsMethod]
    // summary: unrecognized selector forwarding to other objects
    TestObject_2* obj = [[TestObject_2 alloc] init];
    [obj performSelector:NSSelectorFromString(@"testObject_1ExistsMethod")];
}

void test_4() {
    // test: TestObject_3 override the methd methodSignatureForSelector: and forwardInvocation:, and than call a not exist method
    // result: first, call forwardingTargetForSelector:, methodSignatureForSelector:, forwardInvocation:, and than not crash
    // summary: TestObject_3 handle unrecognized selector
    TestObject_3* obj = [[TestObject_3 alloc] init];
    [obj performSelector:NSSelectorFromString(@"not exists sel")];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        test_0();
//        test_1();
//        test_2();
//        test_3();
        test_4();
    }
    return 0;
}
