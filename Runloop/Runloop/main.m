//
//  main.m
//  Runloop
//
//  Created by kkk on 2019/10/22.
//  Copyright © 2019 kkk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
/*
 runloop即运行循环，在程序运行中循环处理事情
 可应用在定时器、performSelector、GCD、事件响应、手势识别、界面刷新、网络请求、autoreleasepool等
 */
int main(int argc, char * argv[]) {
    @autoreleasepool {
        //UIApplicationMain中会创建runloop，内部有类似do while的循环来保证程序的持续运行、处理各种事件、节省CPU资源，提高程序效率，有事做事，没事休眠
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
