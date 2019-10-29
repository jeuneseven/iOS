//
//  ControlledThread.m
//  Runloop
//
//  Created by kkk on 2019/10/28.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ControlledThread.h"

@interface InnerThread : NSThread

@end

@implementation InnerThread

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end

@interface ControlledThread ()

@property (nonatomic, strong) InnerThread *innerThread;
@property (nonatomic, assign) BOOL isStopped;

@end

@implementation ControlledThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isStopped = NO;
        
        __weak typeof (self) weakSelf = self;
        self.innerThread = [[InnerThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            /**
             CF创建runloop方式
             
             //创建上下文，初始化结构体
             CFRunLoopSourceContext context = {0};
             //创建source
             CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
             //添加source
             CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
             //销毁source
             CFRelease(source);
             //启动runloop
             //true代表执行完source就会退出当前loop，可以传false代表执行source之后不要退出
             CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
             */
        }];
    }
    return self;
}

- (void)start {
    if (!self.innerThread) {
        return;
    }
    
    [self.innerThread start];
}

- (void)executeTask:(ControlledThreadTask)task {
    if (!self.innerThread || !task) {
        return;
    }
    
    [self performSelector:@selector(executeTaskOnThread:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)stop {
    if (!self.innerThread) {
        return;
    }
    [self performSelector:@selector(stopRunloop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

- (void)stopRunloop {
    self.isStopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)executeTaskOnThread:(ControlledThreadTask)task {
    task();
}

- (void)dealloc {
    [self stop];
}

@end
