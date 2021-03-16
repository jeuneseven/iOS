//
//  main.m
//  Category
//
//  Created by kkk on 2019/9/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"
#import "SomeClass+Category.h"
#import "SomeClass+OtherCategory.h"
#import "SubSomeClass.h"
#import <objc/runtime.h>

//打印类的方法列表
void printMethodListOfClass(Class cls) {
    unsigned int count;
    Method *method_list = class_copyMethodList(cls, &count);
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        Method method = method_list[i];
        //获取方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        [tempArray addObject:methodName];
    }
    NSLog(@"class == %@ class method list == %@", cls, tempArray);
    
    free(method_list);
}

//编译器参数 -Objc 可以在编译时让编译器知道有分类的数据需要引入
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SomeClass *object = [[SomeClass alloc] init];
//        [object categoryMethod];
//        调用类方法与load方法不同，是直接调用objc_msgSend方法，是通过isa找到对应的类或元类
//        [SomeClass classMethod];
//        objc_msgSend(@"SomeClass", @selector(classMethod));
        
//        printMethodListOfClass(object_getClass([SomeClass class]));
        //直接调用load方法与系统调用load方法不同，如果分类中实现了load方法，将按照编译顺序调用load方法，后编译先调用，如果本类和分类都没有实现，将调用父类的load方法，如果父类也没有实现，将查找父类的分类
        //objc_msgSend(@"SubSomeClass", @selector(load));
//        [SubSomeClass load];
        //实质上为：
        //objc_msgSend(@"SomeClass", @selector(initialize));
        //objc_msgSend(@"SubSomeClass", @selector(initialize));
        //由于SubSomeClass没有实现initialize方法，所以依旧会调用父类的initialize
//        [SubSomeClass new];
        
        SomeClass *someObject = [[SomeClass alloc] init];
        someObject.integerValue = 10;
        someObject.stringValue = @"1";
        someObject.string = @"10";
        
        NSLog(@"someObject.integerValue == %ld", someObject.integerValue);
        NSLog(@"someObject.stringValue == %@", someObject.stringValue);
        NSLog(@"someObject.string == %@", someObject.string);
        
        {
            SomeClass *aObject = [[SomeClass alloc] init];
            objc_setAssociatedObject(someObject, @"temp", aObject, OBJC_ASSOCIATION_ASSIGN);
        }
        //将会出现野指针，因为OBJC_ASSOCIATION不支持weak类型，在大括号之外，aObject已经销毁，访问已经销毁的内存将会崩溃
//        NSLog(@"objc_getAssociatedObject == %@", objc_getAssociatedObject(someObject, @"temp"));
    }
    return 0;
}
