//
//  main.m
//  MRC
//
//  Created by kkk on 2019/11/4.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"
#import "OtherClass.h"

void retainTest(void) {
    OtherClass *otherObject = [[OtherClass alloc] init];
    SomeClass *someObject = [[SomeClass alloc] init];
    
    [someObject setOtherObject:otherObject];
    
    SomeClass *someObject2 = [[SomeClass alloc] init];
    
    [someObject2 setOtherObject:otherObject];
    
    [someObject release];
    [otherObject release];
    [someObject2 release];
    
    SomeClass *sObject = [SomeClass someObject];
    NSLog(@"sObject == %@", sObject);
}

void copyMutableCopyTest(void) {
    /*
     copy的目的是产生一份与源对象不影响的拷贝，改变源对象或拷贝对象互相都不影响
     iOS有两种拷贝方案，copy返回不可变拷贝，mutableCopy返回可变拷贝
     即：不可变对象调用copy会产生浅拷贝，其他情况会产生深拷贝
     */
    
    NSString *string1 = @"123";
    NSMutableString *string2 = [string1 copy];//浅拷贝，指针拷贝，没有产生新的对象，只是将对象的计数器+1
    NSMutableString *string3 = [string1 mutableCopy];//深拷贝，拷贝内容，产生新对象
    //        [string2 appendString:@"456"];//会崩溃，因为copy返回的是不可变对象
    [string3 appendString:@"456"];
    
    NSLog(@"%@ %@ %@", string1, string2, string3);
    //string1 == string2 地址相同，因为copy是不可变拷贝，所以没必要地址不同
    NSLog(@"%p %p %p", string1, string2, string3);
    
    [string1 release];
    [string2 release];
    [string3 release];
    
    NSMutableString *string4 = [[NSMutableString alloc] initWithFormat:@"789"];
    NSString *string5 = [string4 copy];//深拷贝，调用对象是可变对象
    NSMutableString *string6 = [string4 mutableCopy];//深拷贝，调用对象是可变对象
    //        [string5 appendString:@"456"];//会崩溃，因为copy返回的是不可变对象，不管是可变还是不可变对象调用
    [string6 appendString:@"012"];
    
    NSLog(@"%@ %@ %@", string4, string5, string6);
    NSLog(@"%p %p %p", string4, string5, string6);
    
    [string4 release];
    [string5 release];
    [string6 release];
    
    NSLog(@"\n");
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", nil];
    NSArray *array2 = [array1 copy];//浅拷贝
    NSMutableArray *array3 = [array1 mutableCopy];//深拷贝
    
    NSLog(@"%p %p %p", array1, array2, array3);
    
    [array1 release];
    [array2 release];
    [array3 release];
}

void mutableArrayCopy(void) {
    SomeClass *sObject = [[SomeClass alloc] init];
    sObject.array = [NSMutableArray array];
    //崩溃，因为array修饰词为copy，传入的值都会被copy，为不可变
    [sObject.array addObject:@"1"];
    
    [sObject release];
}

void copying(void) {
    SomeClass *sObject1 = [[SomeClass alloc] init];
    sObject1.intValue = 10;
    
    SomeClass *sObject2 = [sObject1 copy];
    sObject2.intValue = 11;
    
    NSLog(@"sObject1.intValue == %ld sObject2.intValue == %ld", sObject1.intValue, sObject2.intValue);
}

/**
 ARC：LLVM+Runtime，自动的帮我们添加release等操作；弱引用是runtime时进行自动操作
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        retainTest();
//        copyMutableCopyTest();
//        mutableArrayCopy()
//        copying();
    }
    return 0;
}
