//
//  SubSubSomeClass.m
//  Runtime
//
//  Created by kkk on 2019/10/3.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "SubSubSomeClass.h"
#import <objc/runtime.h>

@implementation SubSubSomeClass

void c_instanceMethod(id self, SEL _cmd) {
    NSLog(@"%s", __func__);
}

void c_classMethod(id self, SEL _cmd) {
    NSLog(@"%s", __func__);
}

- (void)subSubSomeMethod {
    NSLog(@"%s", __func__);
}

- (void)instanceMethod {
    NSLog(@"%s", __func__);
}

+ (void)classMethod {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(noImpClassMethod)) {
        Method classMethod = class_getClassMethod(object_getClass(self), @selector(classMethod));
        class_addMethod(object_getClass(self), sel, method_getImplementation(classMethod), method_getTypeEncoding(classMethod));
        class_addMethod(object_getClass(self), sel, (IMP)c_classMethod, "v@:");
        return YES;//返回值并无实际用处，只用于打印，为代码可读性需要返回YES
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(noImpInstanceMethod)) {
        //objc_method 与 method_t结构类似
        Method instanceMethod = class_getInstanceMethod(self, @selector(instanceMethod));
        //动态添加方法的实现
        class_addMethod(self, sel, method_getImplementation(instanceMethod), method_getTypeEncoding(instanceMethod));
        //还可以添加c语言函数实现
        class_addMethod(self, sel, (IMP)c_instanceMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
