//
//  ViewController.m
//  NSProxy
//
//  Created by kkk on 2019/12/6.
//  Copyright © 2019 kkk. All rights reserved.
//

#import "ViewController.h"
#import "MyProxy.h"
#import "SubProxy.h"

@interface ViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //输出结果 0 1，因为NSProxy重写了isKindOfClass方法，并且直接进入消息转发阶段，有target进行isKindOfClass:的消息转发
    MyProxy *objectProxy = [MyProxy proxyWithTarget:self];
    SubProxy *pureProxy = [SubProxy proxyWithTarget:self];
    NSLog(@"%d %d", [objectProxy isKindOfClass:[ViewController class]], [pureProxy isKindOfClass:[ViewController class]]);
    
    //分别使用 NSObject 和 NSProxy 方案进行消息转发
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:[MyProxy proxyWithTarget:self] selector:@selector(timerLog) userInfo:nil repeats:YES];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:[SubProxy proxyWithTarget:self] selector:@selector(timerLog) userInfo:nil repeats:YES];
}

- (void)timerLog {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
}

@end
