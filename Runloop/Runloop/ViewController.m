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
     */
}


@end
