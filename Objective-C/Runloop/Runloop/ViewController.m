//
//  ViewController.m
//  Runloop
//
//  Created by kkk on 2019/10/22.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"
#import "SomeThread.h"

@interface ViewController ()

@property (nonatomic, strong) SomeThread *someThread;
@property (nonatomic, assign) BOOL isStop;

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
     runloop中有多个mode，currentMode 表示当前的mode，需要切换时，要退出当前mode，重新选择mode进入，进入后如果发现没有包含任何内容的话，就会退出，切换是在runloop内部进行切换的，并不会退出整体runloop
     mode中包含：source0，source1，observer，timer
     
     runloop休眠与线程阻塞不同，是从用户态——>内核态的状态转换mach_msg()
     
     runloop循环处理以下内容：
     source0:触摸事件处理、performSelector:onThread:
     source1:基于port的线程间通信、系统事件的捕捉（捕捉后分发给source0处理）
     timer:timer、performSelector:onThread:afterDelay:
     observer:监听runloop状态、UI刷新、autoreleasepool
     */
    
    /*
    常见模式：
    kCFRunLoopDefaultMode;//通常主线程在该模式下运行，也是App的默认mode
    UITrackingRunLoopMode;//界面跟踪，用于scrollview追踪滑动，保证界面滑动时不受其他mode影响
    UIInitializationRunLoopMode;//在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用
    GSEventReceiveRunLoopMode;//接收系统事件的内部 Mode，通常用不到
    kCFRunLoopCommonModes;//做占位用，不是真正的mode
    */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: {
                NSLog(@"kCFRunLoopEntry");
                break;
            }
            case kCFRunLoopBeforeTimers: {
                NSLog(@"kCFRunLoopBeforeTimers");
                break;
            }
            case kCFRunLoopBeforeSources: {
                NSLog(@"kCFRunLoopBeforeSources");
                break;
            }
            case kCFRunLoopBeforeWaiting: {
                NSLog(@"kCFRunLoopBeforeWaiting");
                break;
            }
            case kCFRunLoopAfterWaiting: {
                NSLog(@"kCFRunLoopAfterWaiting");
                break;
            }
            case kCFRunLoopExit: {
                NSLog(@"kCFRunLoopExit");
                break;
            }
            default:
                break;
        }
    });
    //添加监听到runloop中
//    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{//只有切换到主线程队列执行时才会涉及到runloop，其他GCD不涉及runloop
            ;
        });
    });
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.f repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%s", __func__);
    }];
    //将timer添加到runloop中可以避免scrollview滚动的时候timer失效问题
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.someThread = [[SomeThread alloc] initWithTarget:self selector:@selector(keepThread) object:nil];
    [self.someThread start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(doSomething) onThread:self.someThread withObject:nil
            waitUntilDone:NO];
}
//线程保活
- (void)keepThread {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    //执行到此处，线程会休眠，但不会死
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
//    [[NSRunLoop currentRunLoop] run];//开启无限循环，不能手动停止，用于开启永不销毁的runloop
    while (self && !self.isStop) {//self可能被清空，所以要判断是否为空
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    //由于线程执行后将会休眠，runloop使其保活，所以不会执行此行
    NSLog(@"%d", __LINE__);
}

- (void)doSomething {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}

- (void)stop {
    //使用完runloop后，要将runloop停掉
    self.isStop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.someThread = nil;//清空线程
}

- (void)dealloc {
    if (!self.someThread) {
        return;
    }
    //waitUntilDone 应设置为 YES，代表等待线程执行完毕，否则会发生坏内存访问
    [self performSelector:@selector(stop) onThread:self.someThread withObject:nil
            waitUntilDone:YES];
}

@end
