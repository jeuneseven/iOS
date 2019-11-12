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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
        
        /*
         copy的目的是产生一份与源对象不影响的拷贝，改变源对象或拷贝对象互相都不影响
         iOS有两种拷贝方案，copy返回不可变拷贝，mutableCopy返回可变拷贝
         */
        
        NSString *string1 = @"123";
        NSMutableString *string2 = [string1 copy];
        NSMutableString *string3 = [string1 mutableCopy];
//        [string2 appendString:@"456"];//会崩溃，因为copy返回的是不可变对象
        [string3 appendString:@"456"];
        
        NSLog(@"%@ %@ %@", string1, string2, string3);
        
        NSMutableString *string4 = [[NSMutableString alloc] initWithFormat:@"789"];
        NSMutableString *string5 = [string4 copy];
        NSMutableString *string6 = [string4 mutableCopy];
//        [string5 appendString:@"456"];//会崩溃，因为copy返回的是不可变对象，不管是可变还是不可变对象调用
        [string6 appendString:@"012"];
        
        NSLog(@"%@ %@ %@", string4, string5, string6);
    }
    return 0;
}
