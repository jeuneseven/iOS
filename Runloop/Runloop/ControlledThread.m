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
