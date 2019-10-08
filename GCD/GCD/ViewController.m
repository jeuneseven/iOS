//
//  ViewController.m
//  GCD
//
//  Created by kkk on 2019/10/7.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
    同步、异步只能决定是在当前线程执行还行开启子线程执行，与串行还是并发无关
        同步是在当前线程中执行任务，不具备开启新线程的能力
        异步是在新线程中执行任务，具备开启新线程的能力
    并发、串行主要影响任务的执行方式
        并发是指多个任务并发（同时）执行
        串行是指一个任务执行完毕后，再执行下一个任务
    总结：
    1.同步、并发：不会开启新线程，串行执行任务
    2.同步、串行：不会开启新线程，串行执行任务
    3.同步、主队列：不会开启新线程，串行执行任务
    4.异步、并发：会开启新线程，并行执行任务
    5.异步、串行：会开启新线程，串行执行任务
    6.异步、主队列：不会开启新线程，串行执行任务
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self childThreadAsync];
//
//    [self childThreadSync];
    
//    [self concurrentJob];
    //只要是sync，不管是串行还行并发，都是在当前线程执行
//    [self concurrentJobSync];
    
//    [self dispatchQueueSerial];
    
//    [self dispatchQueueSerialAsync];
    //主线程异步并不会开启新线程，任务是放在主队列中执行
    [self mainQueueAsync];
}

- (void)childThreadAsync {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"子线程异步执行任务 %@", [NSThread currentThread]);
    });
}

- (void)childThreadSync {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_sync(queue, ^{
        NSLog(@"当前线程同步执行任务 %@", [NSThread currentThread]);
    });
}
//并发交错执行
- (void)concurrentJob {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"并发执行任务1 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"并发执行任务2 %@", [NSThread currentThread]);
        }
    });
}
//同步没有并发执行
- (void)concurrentJobSync {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"并发执行任务1 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"并发执行任务2 %@", [NSThread currentThread]);
        }
    });
}
//当前线程（主线程）串行队列
- (void)dispatchQueueSerial {
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"执行任务1 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"执行任务2 %@", [NSThread currentThread]);
        }
    });
    
//    dispatch_release(queue); ARC下GCD无需释放
}
//子线程串行队列
- (void)dispatchQueueSerialAsync {
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"执行任务1 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"执行任务2 %@", [NSThread currentThread]);
        }
    });
    
//    dispatch_release(queue); ARC下GCD无需释放
}

- (void)mainQueueAsync {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务 %@", [NSThread currentThread]);
    });
}

@end
