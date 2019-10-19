//
//  ViewController.m
//  GCD
//
//  Created by kkk on 2019/10/7.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"
#import "BaseNoLockDemo.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairLockDemo.h"
#import "PthreadMutexLockDemo.h"
#import "PthreadMutexRecursiveLockDemo.h"
#import "PthreadMutexConditionLockDemo.h"
#import "NSLockDemo.h"
#import "NSRecursiveLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueDemo.h"
#import "DispatchSemaphoreDemo.h"
#import "SynchronizedDemo.h"
#import <libkern/OSAtomic.h>

@interface ViewController ()

@property (nonatomic, strong) BaseNoLockDemo *demo;

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
//    [self mainQueueAsync];
    /*
        结论：使用sync往当前串行队列中添加任务时，会产生死锁
     */
//    [self mainQueueSyncDeadlock];
    
//    [self mainQueueAsyncNotDeadlock];
    
//    [self serialQueueAsyncSyncDeadlock];
    
//    [self serialQueueAsyncConcurrentQueueSyncNotDeadlock];
    
//    [self serialQueueAsyncSerialQueueSyncNotDeadlock];
    
//    [self concurrentQueueAsyncSyncNotDeadlock];
    
//    [self globalQueueVSCustomQueue];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self noRunloopThreadLog];
    
//    [self haveRunloopThreadLog];
    
//    [self threadLog];
    
//    [self gcdGroupMainQueue];
    
//    [self gcdGroupNotifyQueue];
    
//    [self saleTickets];
    
//    [self moneyTest];
    
    //使用线程同步技术解决多线程隐患问题
//    [self saleTicketsOSSpinLock];
//    [self moneyTestOSSpinLock];
    
//    [self moneyTestOSUnfairLock];
//    [self saleTicketsOSUnfairLock];
    
//    [self moneyTestPthreadMutexLock];
//    [self saleTicketsPthreadMutexLock];
    
//    [self pthreadMutexRecursiveLockDemo];
    
//    [self pthreadMutexConditionLockDemo];
    
//    [self nsLockDemo];
    
//    [self nsRecursiveLockDemo];
//    [self nsConditionDemo];
//    [self nsConditionLockDemo];
    
//    [self serialQueueDemo];
    
//    [self semaphoreDemo];
    
    [self synchronizedDemo];
}

- (void)synchronizedDemo {
    self.demo = [[SynchronizedDemo alloc] init];
    [self.demo log];
//    [self.demo moneyTest];
//    [self.demo saleTickets];
}

- (void)semaphoreDemo {
    self.demo = [[DispatchSemaphoreDemo alloc] init];
//    [self.demo log];
    [self.demo saleTickets];
//    [self.demo moneyTest];
}

- (void)serialQueueDemo {
    self.demo = [[SerialQueueDemo alloc] init];
    [self.demo moneyTest];
    [self.demo saleTickets];
}

- (void)nsConditionLockDemo {
    self.demo = [[NSConditionLockDemo alloc] init];
    [self.demo log];
}

- (void)nsConditionDemo {
    self.demo = [[NSConditionDemo alloc] init];
    [self.demo log];
}

- (void)nsRecursiveLockDemo {
    self.demo = [[NSRecursiveLockDemo alloc] init];
    [self.demo log];
}

- (void)nsLockDemo {
    self.demo = [[NSLockDemo alloc] init];
    [self.demo moneyTest];
    [self.demo saleTickets];
}

- (void)pthreadMutexConditionLockDemo {
    self.demo = [[PthreadMutexConditionLockDemo alloc] init];
    [self.demo log];
}

- (void)pthreadMutexRecursiveLockDemo {
    self.demo = [[PthreadMutexRecursiveLockDemo alloc] init];
    [self.demo log];
}

- (void)moneyTestPthreadMutexLock {
    self.demo = [[PthreadMutexLockDemo alloc] init];
    [self.demo moneyTest];
}

- (void)saleTicketsPthreadMutexLock {
    self.demo = [[PthreadMutexLockDemo alloc] init];
    [self.demo saleTickets];
}

- (void)moneyTestOSUnfairLock {
    self.demo = [[OSUnfairLockDemo alloc] init];
    [self.demo moneyTest];
}

- (void)saleTicketsOSUnfairLock {
    self.demo = [[OSUnfairLockDemo alloc] init];
    [self.demo saleTickets];
}

- (void)moneyTestOSSpinLock {
    self.demo = [[OSSpinLockDemo alloc] init];
    [self.demo moneyTest];
}

- (void)saleTicketsOSSpinLock {
    self.demo = [[OSSpinLockDemo alloc] init];
    [self.demo saleTickets];
}

- (void)gcdGroupNotifyQueue {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"并发执行任务1 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"并发执行任务2 %@", [NSThread currentThread]);
        }
    });
    //等任务1、2执行完再执行
    dispatch_group_notify(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"并发执行任务3 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"并发执行任务4 %@", [NSThread currentThread]);
        }
    });
}

- (void)gcdGroupMainQueue {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"并发执行任务1 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"并发执行任务2 %@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        for (NSInteger i = 0; i < 3; i++) {
            NSLog(@"回到主线程执行任务3 %@", [NSThread currentThread]);
        }
    });
}

- (void)threadLog {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"执行任务1");
        //runloop子线程包保活，使线程保持激活状态，线程一旦执行完，生命周期就会结束
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    [thread start];
    
    [self performSelector:@selector(log2) onThread:thread withObject:nil waitUntilDone:YES];
}

- (void)haveRunloopThreadLog {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"执行任务1");
        //该方法是定义在runloop中的，是往runloop中添加定时器，但子线程没有runloop，所以执行无效
//        [self performSelector:<#(SEL)#> withObject:<#(id)#>] 本质是objc_msgSend
        //runloop实现可参考http://www.gnustep.org/resources/downloads.php
        [self performSelector:@selector(log2) withObject:nil afterDelay:.0f];
        NSLog(@"执行任务3");
        //启动runloop，performSelector:withObject:afterDelay:已经往runloop中添加了定时器，runloop中只要有timer、observer、source之一就可启动，所以本句可省略
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        //主线程几乎所有的事情都是交给runloop执行的，比如UI渲染、点击事件处理、定时器等
    });
}

- (void)noRunloopThreadLog {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"执行任务1");
        //该方法是定义在runloop中的，是往runloop中添加定时器，但子线程没有runloop，所以执行无效
        [self performSelector:@selector(log2) withObject:nil afterDelay:.0f];
        NSLog(@"执行任务3");
    });
}

- (void)log2 {
    NSLog(@"执行任务2");
}

- (void)globalQueueVSCustomQueue {
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t queue2 = dispatch_get_global_queue(0, 0);
    //创建队列时，名称最好取不同
    dispatch_queue_t queue3 = dispatch_queue_create("myQueue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue4 = dispatch_queue_create("myQueue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue5 = dispatch_queue_create("myQueue2", DISPATCH_QUEUE_CONCURRENT);
    //dispatch_queue_t为指针，可以直接打印地址
    //dispatch_get_global_queue是全局并发队列，打印地址相同，自己创建的队列，打印地址不同，即使名字相同
    NSLog(@"%p %p %p %p %p", queue1, queue2, queue3, queue4, queue5);
}

- (void)concurrentQueueAsyncSyncNotDeadlock {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
        dispatch_sync(queue, ^{//虽然与dispatch_async所处的队列相同，但是并发队列，允许多个任务同时执行，所以不会产生死锁
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)serialQueueAsyncSerialQueueSyncNotDeadlock {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("myQueue2", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
        dispatch_sync(queue2, ^{//与dispatch_async所处的队列不同，所以不会造成死锁
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)serialQueueAsyncConcurrentQueueSyncNotDeadlock {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("myQueue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
        dispatch_sync(queue2, ^{//与dispatch_async所处的队列不同，所以不会造成死锁
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)serialQueueAsyncSyncDeadlock {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{//子线程已经将任务2添加到队列中
        NSLog(@"执行任务2");
        dispatch_sync(queue, ^{//又dispatch_sync添加了一个任务3到队列中，要求整个dispatch_async执行完才能执行，所以也会造成死锁
            NSLog(@"执行任务3");
        });
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

- (void)mainQueueAsyncNotDeadlock {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    //dispatch_async 不要求立刻执行，所以不会产生死锁
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    NSLog(@"执行任务3");
}

- (void)mainQueueSyncDeadlock {
    NSLog(@"执行任务1");
    //主队列要符合FIFO原则，在主队列中要等待上一个任务执行完才能执行下一个任务，但dispatch_sync是要在当前任务中执行，会造成死锁
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    NSLog(@"执行任务3");
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
