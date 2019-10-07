//
//  main.m
//  GCD
//
//  Created by kkk on 2019/10/7.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
/*
 多线程方案：
 1.pthread：底层线程控制，跨平台，使用C语言实现
 2.NSThread：面向对象的pthread，需要自己管理线程生命周期，使用OC实现
 3.GCD：为替代NSThread而产生，充分利用设备多核，使用C语言实现，自动管理线程生命周期
 4.NSOperation：面向对象的GCD，并且比GCD更加灵活实用，使用OC实现，自动管理线程生命周期
 2、3、4 创建线程时都是依赖pthread
 */
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
