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
        SomeClass *object = [[SomeClass alloc] init];
        [object categoryMethod];
//        调用类方法与load方法不同，是直接调用objc_msgSend方法，是通过isa找到对应的类或元类
//        [SomeClass classMethod];
//        objc_msgSend(@"SomeClass", @selector(classMethod));
        
        printMethodListOfClass(object_getClass([SomeClass class]));
    }
    return 0;
}
