//
//  main.m
//  KVC
//
//  Created by kkk on 2019/7/5.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SomeClass *someObject = [[SomeClass alloc] init];
        someObject.otherObject = [[OtherClass alloc] init];
        //KVC的基本使用：set和get
        [someObject setValue:@1 forKeyPath:@"otherObject.intValue"];
        NSNumber *intValue = [someObject valueForKeyPath:@"otherObject.intValue"];
        NSLog(@"intValue == %ld", [intValue integerValue]);
    }
    return 0;
}
