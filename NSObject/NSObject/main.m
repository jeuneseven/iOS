//
//  main.m
//  NSObject
//
//  Created by kkk on 2019/6/12.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface SomeClass : NSObject {
    @public
    int intA;
}
@property (nonatomic, assign) int intB;

@end

@implementation SomeClass

@end

@interface OtherClass : SomeClass {
    @public
    double doubleA;
}

@end

@implementation OtherClass

@end

struct NSObject_IMPL {
    Class isa;//8个字节
};

struct SomeClass_IMPL {
    struct NSObject_IMPL isa; //8个字节
    int intA; // 4
    int intB; // 4
};//内存对齐：结构体的最终大小必须是最大成员的倍数

struct OtherClass_IMPL {
    struct NSObject_IMPL isa; // 8
    int intA; // 4
    int intB; // 4
    double doubleA; // 8
};

//xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *someObject = [[SomeClass alloc] init];
        someObject->intA = 1;
        someObject.intB = 10;
        
        OtherClass *otherObject = [[OtherClass alloc] init];
        otherObject->doubleA = 11.f;

        //24字节
        NSLog(@"class_getInstanceSize([OtherClass class]) == %zd", class_getInstanceSize([OtherClass class]));
        //32字节
        NSLog(@"malloc_size((__bridge const void *)object) == %zd", malloc_size((__bridge const void *)otherObject));
        
        //16字节
        NSLog(@"class_getInstanceSize([SomeClass class]) == %zd", class_getInstanceSize([SomeClass class]));
        //16字节
        NSLog(@"malloc_size((__bridge const void *)object) == %zd", malloc_size((__bridge const void *)someObject));
        
        struct SomeClass_IMPL *someClassImp = (__bridge struct SomeClass_IMPL *)(someObject);
        NSLog(@"A == %d B == %d", someClassImp->intA, someClassImp->intB);
        
        NSObject *object = [[NSObject alloc] init];

        /*

         size_t class_getInstanceSize(Class cls)
{
    if (!cls) return 0;
    return cls->alignedInstanceSize();
}

         // May be unaligned depending on class's ivars.
    uint32_t unalignedInstanceSize() {
        assert(isRealized());
        return data()->ro->instanceSize;
    }

    // Class's ivar size rounded up to a pointer-size boundary.
    uint32_t alignedInstanceSize() {
        return word_align(unalignedInstanceSize());
    }

    size_t instanceSize(size_t extraBytes) {
        size_t size = alignedInstanceSize() + extraBytes;
        // CF requires all objects be at least 16 bytes.
        if (size < 16) size = 16;
        return size;
    }
         */

        //debug->view memory
        //或 x(memory read) / 跟随 数量 格式（x为16进制，f为浮点，d是十进制） 字节数（b 1字节，h 2字节，w 4字节，g 8字节）例如：x/4db
        
        //memory write 写内存 
        
        //获取NSObject类的成员变量所占用大小 8字节
        NSLog(@"class_getInstanceSize([NSObject class]) == %zd", class_getInstanceSize([NSObject class]));

        //获取object指针所指向内存的大小 16字节 系统按照16的倍数即bucket来分配内存大小
        //        malloc_size(<#const void* ptr#>)
        NSLog(@"malloc_size((__bridge const void *)object) == %zd", malloc_size((__bridge const void *)object));

    }
    return 0;
}
