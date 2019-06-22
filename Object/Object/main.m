//
//  main.m
//  Object
//
//  Created by kkk on 2019/6/19.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NSObject+Category.h"

@interface SomeClass : NSObject <NSCopying>
@property (nonatomic, assign) int intVaule;

- (void)instanceMethod;
+ (void)classMethod;

@end

@implementation SomeClass

- (void)instanceMethod {
    
}

+ (void)classMethod {
    NSLog(@"%s %p", __func__, self);
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

@end

@interface OtherClass : SomeClass <NSCoding>

@property (nonatomic, assign) double doubleValue;


- (void)otherInstanceMethod;
+ (void)otherClassMethod;

@end

@implementation OtherClass

- (void)otherInstanceMethod {
    
}

+ (void)otherClassMethod {
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {

}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

@end

struct SomeClassStruct {
    Class isa;
    Class superClass;
};

struct OtherClassStruct {
    Class isa;
    Class superClass;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class someClassSuperClass = [SomeClass class];
        Class otherClassSuperClass = [OtherClass class];
        
        // 类的superclass指针直接指向父类
        
        // p/x someClassSuperClass 0x00000001000025b8
        struct SomeClassStruct *someClassStructSuperClass = (__bridge struct SomeClassStruct *)(someClassSuperClass);
        // p/x otherClassStructSuperClass->superClass 0x00000001000025b8
        struct OtherClassStruct *otherClassStructSuperClass = (__bridge struct OtherClassStruct *)(otherClassSuperClass);
        
        NSLog(@"someClassSuperClass == %p, otherClassSuperClass == %p", someClassSuperClass, otherClassSuperClass);
        
        //对象的isa指针->类对象 isa指针-> 元类对象
        //64bit开始，isa之间需&ISA_MASK才能获取到真实地址
        /*
         # if __arm64__
         #   define ISA_MASK        0x0000000ffffffff8ULL
         # elif __x86_64__
         #   define ISA_MASK        0x00007ffffffffff8ULL
         */
        // p/x isaObject->isa 0x001d800100002591
        // p/x 0x001d800100002591 & 0x00007ffffffffff8 == 0x0000000100002590
        SomeClass *isaObject = [[SomeClass alloc] init];
        // p/x someClass 0x0000000100002590
        Class someClass = [SomeClass class];
        // p/x someClassStruct->isa 0x001d800100002569 & 0x00007ffffffffff8 == 0x0000000100002568
        struct SomeClassStruct *someClassStruct = (__bridge struct SomeClassStruct *)(someClass);
        // p/x metaSomeClass 0x0000000100002568
        Class metaSomeClass = object_getClass(someClass);
        
        NSLog(@"isaObject == %p, someClass == %p, metaSomeClass == %p", isaObject, someClass, metaSomeClass);
        
        NSLog(@"%p %p", [NSObject class], [SomeClass class]);
        [SomeClass classMethod];
        [NSObject classMethod];
        
        SomeClass *someObject = [[SomeClass alloc] init];
        //((void *)objc_msgSend)(someObject, sel_registerName("instanceMethod"));
        [someObject instanceMethod];
        //((void *)objc_msgSend)(objc_getClass("SomeClass"), sel_registerName("classMethod"));
        [SomeClass classMethod];
        
        //实例对象中存放isa指针、其他成员变量
        //isa指针指向类对象，调用实例方法时使用该指针指向的类对象进行查找，如未找到，利用类对象的superclass沿继承链条查找
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        //实例对象地址不同
        NSLog(@"%p %p", object1, object2);
        
        //class对象在内存中存储isa指针、superclass指针、类的属性信息property、类的实例对象方法信息(instance method)、类的协议信息、类的成员变量信息，每个类只有一个类对象
        //class方法返回的始终是class对象，即类对象
        //isa指针指向元类对象，调用类方法时使用该指针指向的元类对象进行查找，如未找到，利用元类对象的superclass沿继承链条查找
        //superclass指针指向父类的类对象、NSObject的superclass为nil
        Class objectClass1 = [object1 class];
        Class objectClass2 = [[object2 class] class];
        Class objectClass3 = object_getClass(object1);
        Class objectClass4 = object_getClass(object2);
        Class objectClass5 = [NSObject class];
        //类对象的地址是一样的
        NSLog(@"%p %p %p %p %p %d", objectClass1, objectClass2, objectClass3, objectClass4, objectClass5, class_isMetaClass(objectClass1));
        
        //元类对象存储isa指针、superclass指针、类方法(class method)；元类对象与类对象都为class类型，其余与类对象相同的存储信息为null
        //元类对象通过类对象获取；每个类只有一个元类对象
        //superclass指针指向父类的元类对象，基类（NSObject）的superclass指针指向NSObject类对象
        //元类对象的isa指向基类的元类，即NSObject的元类，NSObject指向本身
        Class objectMetaClass = object_getClass([NSObject class]);
        NSLog(@"objectMetaClass == %p %d", objectMetaClass, class_isMetaClass(objectMetaClass));
        
//        objc_getClass(<#const char * _Nonnull name#>) 传入字符串，返回类对象
//        Class objc_getClass(const char *aClassName)
//        {
//            if (!aClassName) return Nil;
//
//            // NO unconnected, YES class handler
//            return look_up_class(aClassName, NO, YES);
//        }
        
//        object_getClass(<#id  _Nullable obj#>) 根据传入的对象返回类对象，传入实例对象返回类对象，传入类对象返回元类对象
//        Class object_getClass(id obj)
//        {
//            if (obj) return obj->getIsa();
//            else return Nil;
//        }
    }
    return 0;
}
