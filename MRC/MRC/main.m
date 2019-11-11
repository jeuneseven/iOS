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
    }
    return 0;
}
