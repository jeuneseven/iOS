//
//  main.m
//  Object
//
//  Created by kkk on 2019/6/19.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface SomeClass : NSObject <NSCopying>
@property (nonatomic, assign) int intVaule;

- (void)instanceMethod;
+ (void)classMethod;

@end

@implementation SomeClass

- (void)instanceMethod {
    
}

+ (void)classMethod {
    
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *someObject = [[SomeClass alloc] init];
        //((void *)objc_msgSend)(someObject, sel_registerName("instanceMethod"));
        [someObject instanceMethod];
        //((void *)objc_msgSend)(objc_getClass("SomeClass"), sel_registerName("classMethod"));
        [SomeClass classMethod];
        
        //实例对象中存放isa指针、其他成员变量
        //isa指针指向类对象
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        //实例对象地址不同
        NSLog(@"%p %p", object1, object2);
        
        //class对象在内存中存储isa指针、superclass指针、类的属性信息property、类的实例对象方法信息(instance method)、类的协议信息、类的成员变量信息，每个类只有一个类对象
        //class方法返回的始终是class对象，即类对象
        //isa指针指向元类对象
        //superclass指针指向父类的类对象
        Class objectClass1 = [object1 class];
        Class objectClass2 = [[object2 class] class];
        Class objectClass3 = object_getClass(object1);
        Class objectClass4 = object_getClass(object2);
        Class objectClass5 = [NSObject class];
        //类对象的地址是一样的
        NSLog(@"%p %p %p %p %p %d", objectClass1, objectClass2, objectClass3, objectClass4, objectClass5, class_isMetaClass(objectClass1));
        
        //元类对象存储isa指针、superclass指针、类方法(class method)；元类对象与类对象都为class类型，其余与类对象相同的存储信息为null
        //元类对象通过类对象获取；每个类只有一个元类对象
        //superclass指针指向父类的元类对象
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
