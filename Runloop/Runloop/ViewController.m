//
//  ViewController.m
//  Runloop
//
//  Created by kkk on 2019/10/22.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //获取runloop
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSRunLoop *mainRunloop = [NSRunLoop mainRunLoop];//获取主线程runloop
    CFRunLoopRef cfRunloop = CFRunLoopGetCurrent();
    CFRunLoopRef cfMainRunloop = CFRunLoopGetMain();//获取主线程runloop
    /*
     每条线程都有一个唯一的与之对应的runloop
     runloop保存在一个全局字典里，线程作为key，runloop是value：runloops[thread]=runloop
     线程刚创建时没有runloop对象，runloop会在第一次获取它时创建
     runloop会在线程结束时销毁
     主线程的runloop已经自动获取（创建），子线程默认没有开启runloop
     runloop中有多个mode，currentMode 表示当前的mode，需要切换时，要退出当前mode，重新选择mode进入，进入后如果发现没有包含任何内容的话，就会退出
     mode中包含：source0，source1，observer，timer
     
     runloop循环处理以下内容：
     source0:触摸事件处理、performSelector:onThread:
     source1:基于port的线程间通信、系统事件的捕捉（捕捉后分发给source0处理）
     timer:timer、performSelector:onThread:afterDelay:
     observer:监听runloop状态、UI刷新、autoreleasepool
     */
    
    //常见模式：
    kCFRunLoopDefaultMode;
    NSDefaultRunLoopMode;
    //kCFRunLoopCommonModes包括kCFRunLoopDefaultMode、
//    CFRunLoopObserverCreate(<#CFAllocatorRef allocator#>, <#CFOptionFlags activities#>, <#Boolean repeats#>, <#CFIndex order#>, <#CFRunLoopObserverCallBack callout#>, NULL);
//    CFRunLoopAddObserver(<#CFRunLoopRef rl#>, <#CFRunLoopObserverRef observer#>, kCFRunLoopCommonModes)
}


@end
