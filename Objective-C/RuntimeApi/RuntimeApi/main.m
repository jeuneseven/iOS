//
//  main.m
//  RuntimeApi
//
//  Created by kkk on 2019/10/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "SomeClass.h"
#import "OtherClass.h"
#import "NSMutableArray+Exchange.h"

void dynamicMethod(id self, SEL _cmd) {
    NSLog(@"%s", __func__);
}
//runtime 还可以用来自动归解档等等，OC代码底层都是封装的runtime
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:@"123"];
        
        SomeClass *replaceMethodObject = [[SomeClass alloc] init];
        IMP otherInstanceMethodIMP = class_getMethodImplementation([SomeClass class], @selector(otherInstanceMethod));
        class_replaceMethod([SomeClass class], @selector(instanceMethod), otherInstanceMethodIMP, "v@:");
        //-[SomeClass otherInstanceMethod]
        [replaceMethodObject instanceMethod];
        //替换方法实现为block
        class_replaceMethod([SomeClass class], @selector(instanceMethod), imp_implementationWithBlock(^{
            NSLog(@"%s", __func__);
        }), "v");
        [replaceMethodObject instanceMethod];
        
        SomeClass *ivarObject = [[SomeClass alloc] init];
        //获取成员变量信息
        Ivar intIvar = class_getInstanceVariable([SomeClass class], "intValue");
        
        NSLog(@"%s %s", ivar_getName(intIvar), ivar_getTypeEncoding(intIvar));
        //设置成员变量信息
        Ivar stringIvar = class_getInstanceVariable([SomeClass class], "stringValue");
        object_setIvar(ivarObject, stringIvar, @"10");
        NSLog(@"ivarObject.stringValue == %@", [ivarObject valueForKey:@"stringValue"]);
        //基本数据类型在设置时需要强制转换
        object_setIvar(ivarObject, intIvar, (__bridge id _Nullable)((void *)11));
        NSLog(@"ivarObject.intValue == %@", [ivarObject valueForKey:@"intValue"]);
        
        unsigned int count;
        //获取类的成员变量列表（使用runtime中的copy需要释放），可以窥探第三方库或系统库的成员变量，对其进行操作，字典转模型等
        Ivar *ivars = class_copyIvarList([NSObject class], &count);
        for (NSInteger i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSLog(@"NSObject: %s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        }
        free(ivars);
        //动态创建一个类
        NSString *dynamicClassName = [NSString stringWithFormat:@"%@", @"DynamicClass"];
        Class dynamicClass = objc_allocateClassPair([NSObject class], dynamicClassName.UTF8String, 0);
        //添加成员变量，类注册完毕后，不能再添加成员变量，因为成员变量是只读的，即已经注册的类不能添加成员变量
        class_addIvar(dynamicClass, "_intValue", 4, 1, @encode(NSInteger));
        //动态添加方法
        class_addMethod(dynamicClass, @selector(dynamicMethod), (IMP)dynamicMethod, "v@:");
        //创建类之后要注册该类，注册后，类对象和元类对象就创建完了
        objc_registerClassPair(dynamicClass);
        id dynamicObject = [[dynamicClass alloc] init];
        NSLog(@"[dynamicObject class] == %@", [dynamicObject class]);
        
        [dynamicObject setValue:@10 forKey:@"_intValue"];
        NSLog(@"%@", [dynamicObject valueForKey:@"_intValue"]);
        
        [dynamicObject performSelector:@selector(dynamicMethod)];
        dynamicObject = nil;//当动态创建的类的实例对象或其子类的实例对象还存在时，不能直接调用objc_disposeClassPair，需要先销毁实例对象
        //不需要使用动态创建的类时要销毁，该方法会销毁类和元类
        objc_disposeClassPair(dynamicClass);
        
        SomeClass *someObject = [[SomeClass alloc] init];
        [someObject instanceMethod];
        //设置对象的类，设置isa指向的类
        object_setClass(someObject, [OtherClass class]);
        [someObject instanceMethod];
    }
    return 0;
}
