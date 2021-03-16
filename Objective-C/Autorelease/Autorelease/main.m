//
//  main.m
//  Autorelease
//
//  Created by kkk on 2019/12/26.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeClass.h"

/**
 
 __AtAutoreleasePool() {atautoreleasepoolobj = objc_autoreleasePoolPush();}
 ~__AtAutoreleasePool() {objc_autoreleasePoolPop(atautoreleasepoolobj);}
 
 { __AtAutoreleasePool __autoreleasepool;
 SomeClass *someObject = ((SomeClass *(*)(id, SEL))(void *)objc_msgSend)((id)((SomeClass *(*)(id, SEL))(void *)objc_msgSend)((id)((SomeClass *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("SomeClass"), sel_registerName("alloc")), sel_registerName("init")), sel_registerName("autorelease"));
 }
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //atautoreleasepoolobj = objc_autoreleasePoolPush();
        //凡是调用autorelease方法的对象，最终都是由AutoreleasePoolPage类来进行管理的
        SomeClass *someObject = [[[SomeClass alloc] init] autorelease];
        //objc_autoreleasePoolPop(atautoreleasepoolobj);
    }
    return 0;
}
