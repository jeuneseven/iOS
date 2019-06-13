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

//@interface SomeClass : NSObject {
//
//}
//
//@end
//
//@implementation SomeClass
//
//@end

//xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp

struct NSObject_IMPL {
    Class isa;//8个字节
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
        
        //获取NSObject类的成员变量所占用大小
        NSLog(@"class_getInstanceSize([NSObject class]) == %zd", class_getInstanceSize([NSObject class]));

        //获取object指针所指向内存的大小
        //        malloc_size(<#const void* ptr#>)
        NSLog(@"malloc_size((__bridge const void *)object) == %zd", malloc_size((__bridge const void *)object));

    }
    return 0;
}
